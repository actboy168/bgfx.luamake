local lm = require "luamake"
local shader = require "examples.shader"
local geometryc = require "examples.geometryc"

shader.compile "examples/42-bunnylod/vs_bunnylod.sc"
shader.compile "examples/42-bunnylod/fs_bunnylod.sc"

geometryc.compile {
    name = "bunny_patched",
    "--packnormal", "1",
}

lm:exe "42-bunnylod" {
    rootdir = lm.BgfxDir / "examples/42-bunnylod",
    deps = {
        "example-runtime",
        "shader-vs_bunnylod",
        "shader-fs_bunnylod",
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
