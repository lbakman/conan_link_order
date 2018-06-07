from conans import ConanFile, CMake


class LibCConan(ConanFile):
    name = "deps.libc"
    version = "1.0"
    description = "Conan module for LibC"
    exports_sources = "cmake/*", "src/*", "include/*", "CMakeLists.txt"
    generators = "cmake", "txt"
    settings = "os", "arch", "compiler", "build_type"
    license = "Example"

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
        self.cpp_info.libs = ["LibC"]

        # Debug library names has "d" at the final
        if self.settings.build_type == "Debug":
            self.cpp_info.libs = ["%s_d" % lib for lib in self.cpp_info.libs]
        # RelWithDebInfo library names has "rd" at the final
        if self.settings.build_type == "RelWithDebInfo":
            self.cpp_info.libs = ["%s_rd" % lib for lib in self.cpp_info.libs]
