local lm = require "luamake"
local shader = require "examples.shader"

shader.compile {
    path = "examples/42-bunnylod/",
    name = "bunnylod",
}

lm:exe "42-bunnylod" {
    rootdir = lm.BgfxDir / "examples/42-bunnylod",
    deps = {
        "example-runtime",
        "shader-bunnylod",
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
        "bunnylod.cpp",
        "progmesh.c",
    }
}
