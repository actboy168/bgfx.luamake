local lm = require "luamake"

require "examples.common"
require "utf8.support-utf8"

lm:exe "geometryc" {
    rootdir = lm.BgfxDir,
    deps = {
        "example-common",
        "bx",
    },
    includes = {
        lm.BxDir / "include",
        "include",
        "3rdparty",
    },
    sources = {
        "tools/geometryc/*.cpp",
        "src/vertexlayout.cpp"
    },
    windows = {
        deps = "bgfx-support-utf8",
    }
}
