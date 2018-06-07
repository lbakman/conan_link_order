from conans import ConanFile, CMake


class LibBConan(ConanFile):
    name = "deps.libb"
    version = "1.0"
    description = "Conan module for LibB"
    exports_sources = "cmake/*", "src/*", "include/*", "CMakeLists.txt"
    generators = "cmake"
    settings = "os", "arch", "compiler", "build_type"
    license = "Example"
    requires = "deps.libc/1.0@lba/testing"

    def build(self):
        cmake = CMake(self, parallel=False)
        cmake.configure(source_dir=".", build_dir=".")
        cmake.build()

    def package(self):
        self.copy("*.h", dst="include", src="include", keep_path=True)
        self.copy("*.lib", dst="lib", src="lib", keep_path=False)
        self.copy("*.a", dst="lib", src="lib", keep_path=False)
        self.copy("*.dll", dst="lib", src="bin", keep_path=False)
        self.copy("*.so", dst="lib", src="lib", keep_path=False)

    def package_info(self):
        self.cpp_info.libs = ["LibB"]

        if self.settings.build_type == "Debug":
            self.cpp_info.libs = ["%s_d" % lib for lib in self.cpp_info.libs]
        if self.settings.build_type == "RelWithDebInfo":
            self.cpp_info.libs = ["%s_rd" % lib for lib in self.cpp_info.libs]
