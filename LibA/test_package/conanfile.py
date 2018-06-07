from conans import ConanFile, tools
import os


class ProjectTestConan(ConanFile):
    settings = "os", "compiler", "build_type", "arch"

    def imports(self):
        self.copy("testsuite*", dst="bin", src="bin")

    def test(self):
        with tools.chdir("bin"):
            self.run(".%stestsuite" % os.sep)
