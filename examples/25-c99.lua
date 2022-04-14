local lm = require 'luamake'

lm:exe '25-c99' {
    rootdir = lm.BgfxDir / 'examples/25-c99',
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
        'helloworld.c',
    },
}
