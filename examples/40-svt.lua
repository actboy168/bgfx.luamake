local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '40-svt' {
    rootdir = lm.BgfxDir / 'examples/40-svt',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/40-svt/fs_vt_mip.sc',
        shaderc.compile 'examples/40-svt/fs_vt_unlit.sc',
        shaderc.compile 'examples/40-svt/vs_vt_generic.sc',
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
        'svt.cpp',
        'vt.cpp',
    },
}
