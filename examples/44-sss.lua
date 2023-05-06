local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local texturec = require 'examples.texturec'
local copy = require 'examples.copyfile'

example_target '44-sss' {
    rootdir = lm.BgfxDir,
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
        texturec.compile 'examples/runtime/textures/fieldstone-n.dds',
        texturec.compile 'examples/runtime/textures/fieldstone-rgba.dds',
        copy.compile 'examples/runtime/meshes/unit_sphere.bin',
    },
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/44-sss/screen_space_shadows.cpp',
    },
}
