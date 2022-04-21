local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '42-bunnylod' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/42-bunnylod/fs_bunnylod.sc',
        shaderc.compile 'examples/42-bunnylod/vs_bunnylod.sc',
        geometryc.compile 'examples/assets/meshes/bunny_patched.obj',
    },
    defines = 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',
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
