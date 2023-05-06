local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local texturec = require 'examples.texturec'

example_target '41-tess' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/41-tess/cs_terrain_init.sc',
        shaderc.compile 'examples/41-tess/cs_terrain_lod.sc',
        shaderc.compile 'examples/41-tess/cs_terrain_update_draw.sc',
        shaderc.compile 'examples/41-tess/cs_terrain_update_indirect.sc',
        shaderc.compile 'examples/41-tess/fs_terrain_render.sc',
        shaderc.compile 'examples/41-tess/fs_terrain_render_normal.sc',
        shaderc.compile 'examples/41-tess/vs_terrain_render.sc',
        texturec.compile 'examples/runtime/textures/dmap.png',
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
        'examples/41-tess/tess.cpp',
    },
}
