local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '46-fsr' {
    rootdir = lm.BgfxDir / 'examples/46-fsr',
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
        'app.cpp',
        'fsr.cpp',
    },
}
