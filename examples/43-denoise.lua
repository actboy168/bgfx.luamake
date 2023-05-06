local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local texturec = require 'examples.texturec'

example_target '43-denoise' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/43-denoise/fs_denoise_apply_lighting.sc',
        shaderc.compile 'examples/43-denoise/fs_denoise_copy.sc',
        shaderc.compile 'examples/43-denoise/fs_denoise_deferred_combine.sc',
        shaderc.compile 'examples/43-denoise/fs_denoise_gbuffer.sc',
        shaderc.compile 'examples/43-denoise/fs_denoise_spatial_3x3.sc',
        shaderc.compile 'examples/43-denoise/fs_denoise_spatial_5x5.sc',
        shaderc.compile 'examples/43-denoise/fs_denoise_temporal.sc',
        shaderc.compile 'examples/43-denoise/fs_denoise_txaa.sc',
        shaderc.compile 'examples/43-denoise/vs_denoise_gbuffer.sc',
        shaderc.compile 'examples/43-denoise/vs_denoise_screenquad.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        geometryc.compile 'examples/assets/meshes/column.obj',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/hollowcube.obj',
        geometryc.compile 'examples/assets/meshes/tree.obj',
        texturec.compile 'examples/runtime/textures/fieldstone-n.dds',
        texturec.compile 'examples/runtime/textures/fieldstone-rgba.dds',
    },
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/43-denoise/denoise.cpp',
    },
}
