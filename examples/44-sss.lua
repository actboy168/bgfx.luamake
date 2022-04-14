local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local texturec = require 'examples.texturec'

lm:exe '44-sss' {
    rootdir = lm.BgfxDir / 'examples/44-sss',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/44-sss/fs_screen_space_shadows.sc',
        shaderc.compile 'examples/44-sss/fs_sss_deferred_combine.sc',
        shaderc.compile 'examples/44-sss/fs_sss_gbuffer.sc',
        shaderc.compile 'examples/44-sss/fs_sss_linear_depth.sc',
        shaderc.compile 'examples/44-sss/fs_sss_unlit.sc',
        shaderc.compile 'examples/44-sss/vs_sss_gbuffer.sc',
        shaderc.compile 'examples/44-sss/vs_sss_screenquad.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        geometryc.compile 'examples/assets/meshes/column.obj',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/hollowcube.obj',
        geometryc.compile 'examples/assets/meshes/tree.obj',
        geometryc.compile 'examples/assets/meshes/unit_sphere.obj',
        texturec.compile 'examples/runtime/textures/fieldstone-n.dds',
        texturec.compile 'examples/runtime/textures/fieldstone-rgba.dds',
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
        'screen_space_shadows.cpp',
    },
}
