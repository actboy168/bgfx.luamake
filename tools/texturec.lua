local lm = require "luamake"

lm:exe "texturec" {
    rootdir = lm.BimgDir,
    deps = {
        "bimg_decode",
        "bimg_encode",
        "bimg",
        "bx",
    },
    includes = {
        lm.BxDir / "include",
        lm.BgfxDir / "include",
        "include",
        "3rdparty/iqa/include"
    },
    sources = {
        "tools/texturec/texturec.cpp",
    },
    windows = {
        deps = "bgfx-support-utf8",
        links = {
            "psapi"
        }
    },
    macos = {
        frameworks = {
            "Cocoa"
        }
    }
}
