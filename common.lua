local lm = require "luamake"

lm:conf {
    cxx = "c++20",
    defines = "BX_CONFIG_DEBUG=" .. (lm.mode == "debug" and 1 or 0),
    msvc = {
        defines = {
            "_CRT_SECURE_NO_WARNINGS",
        },
        includes = lm.BxDir .. "/include/compat/msvc",
    },
    mingw = {
        includes = lm.BxDir .. "/include/compat/mingw",
    },
    linux  = {
        flags = "-fPIC"
    },
    macos = {
        includes = lm.BxDir .. "/include/compat/osx",
    },
    ios = {
        includes = lm.BxDir .. "/include/compat/ios",
        flags = {
            "-fno-objc-arc",
            "-fembed-bitcode",
            "-Wno-unused-function"
        }
    },
    android  = {
        flags = "-fPIC",
        arch = "aarch64",
        vendor = "linux",
        sys = "android33",
    },
    clang = {
        flags = {
            "-Wno-unknown-warning-option",
            "-Wno-tautological-constant-compare",
            "-Wno-unused-variable",
            "-Wno-unused-but-set-variable"
        }
    },
}
