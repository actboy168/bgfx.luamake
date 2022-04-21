local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '27-terrain' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/27-terrain/fs_terrain.sc',
        shaderc.compile 'examples/27-terrain/vs_terrain.sc',
        shaderc.compile 'examples/27-terrain/vs_terrain_height_texture.sc',
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
        'examples/27-terrain/terrain.cpp',
    },
}
