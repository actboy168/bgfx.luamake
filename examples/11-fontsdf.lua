local lm = require 'luamake'

lm:exe '11-fontsdf' {
    rootdir = lm.BgfxDir / 'examples/11-fontsdf',
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
        'fontsdf.cpp',
    },
}
