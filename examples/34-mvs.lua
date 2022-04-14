local lm = require 'luamake'

lm:exe '34-mvs' {
    rootdir = lm.BgfxDir / 'examples/34-mvs',
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
        'mvs.cpp',
    },
}
