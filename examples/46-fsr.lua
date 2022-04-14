local lm = require "luamake"
local shader = require "examples.shader"

lm:exe "46-fsr" {
    rootdir = lm.BgfxDir / "examples/46-fsr",
    deps = {
        "example-runtime",
        shader.compileall "examples/46-fsr",
    },
    defines = "ENTRY_CONFIG_IMPLEMENT_MAIN=1",
    includes = {
        lm.BxDir / "include",
        lm.BimgDir / "include",
        lm.BgfxDir / "include",
        lm.BgfxDir / "examples/common",
        lm.BgfxDir / "3rdparty",
    },
    sources = {
        "app.cpp",
        "fsr.cpp",
    }
}
