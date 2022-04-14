local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '36-sky' {
    rootdir = lm.BgfxDir / 'examples/36-sky',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/36-sky/fs_sky.sc',
        shaderc.compile 'examples/36-sky/fs_sky_color_banding_fix.sc',
        shaderc.compile 'examples/36-sky/fs_sky_landscape.sc',
        shaderc.compile 'examples/36-sky/vs_sky.sc',
        shaderc.compile 'examples/36-sky/vs_sky_landscape.sc',
        geometryc.compile 'examples/assets/meshes/test_scene.obj',
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
        'sky.cpp',
    },
}
