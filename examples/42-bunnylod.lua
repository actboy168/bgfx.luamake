local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

example_target '42-bunnylod' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/42-bunnylod/fs_bunnylod.sc',
        shaderc.compile 'examples/42-bunnylod/vs_bunnylod.sc',
        geometryc.compile 'examples/assets/meshes/bunny_patched.obj',
    },
    defines = lm.os ~= 'android' and 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/42-bunnylod/progmesh.c',
        'examples/42-bunnylod/bunnylod.cpp',
    },
}
