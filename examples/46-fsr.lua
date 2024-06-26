local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local texturec = require 'examples.texturec'

example_target '46-fsr' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/46-fsr/cs_fsr_bilinear_16.sc',
        shaderc.compile 'examples/46-fsr/cs_fsr_bilinear_32.sc',
        shaderc.compile 'examples/46-fsr/cs_fsr_easu_16.sc',
        shaderc.compile 'examples/46-fsr/cs_fsr_easu_32.sc',
        shaderc.compile 'examples/46-fsr/cs_fsr_rcas_16.sc',
        shaderc.compile 'examples/46-fsr/cs_fsr_rcas_32.sc',
        shaderc.compile 'examples/46-fsr/fs_fsr_copy_linear_to_gamma.sc',
        shaderc.compile 'examples/46-fsr/fs_fsr_forward.sc',
        shaderc.compile 'examples/46-fsr/fs_fsr_forward_grid.sc',
        shaderc.compile 'examples/46-fsr/vs_fsr_forward.sc',
        shaderc.compile 'examples/46-fsr/vs_fsr_screenquad.sc',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/hollowcube.obj',
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
        'examples/46-fsr/app.cpp',
        'examples/46-fsr/fsr.cpp',
    },
}
