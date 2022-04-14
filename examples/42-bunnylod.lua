local lm = require "luamake"
local shader = require "examples.shader"
local geometryc = require "examples.geometryc"

geometryc.compile {
    name = "bunny_patched",
    "--packnormal", "1",
}

lm:exe "42-bunnylod" {
    rootdir = lm.BgfxDir / "examples/42-bunnylod",
    deps = {
        "example-runtime",
        shader.compileall "examples/42-bunnylod",
        "mesh-bunny_patched",
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
