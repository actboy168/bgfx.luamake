local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '05-instancing' {
    rootdir = lm.BgfxDir / 'examples/05-instancing',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/05-instancing/fs_instancing.sc',
        shaderc.compile 'examples/05-instancing/vs_instancing.sc',
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
        'instancing.cpp',
    },
}
