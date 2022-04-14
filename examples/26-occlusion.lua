local lm = require 'luamake'

lm:exe '26-occlusion' {
    rootdir = lm.BgfxDir / 'examples/26-occlusion',
    deps = {
        'example-runtime',
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
        'occlusion.cpp',
    },
}
