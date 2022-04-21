local lm = require 'luamake'
local copy = require 'examples.copyfile'

lm:exe '11-fontsdf' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        copy.compile 'examples/runtime/font/special_elite.ttf',
        copy.compile 'examples/runtime/text/sherlock_holmes_a_scandal_in_bohemia_arthur_conan_doyle.txt',
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
        'examples/11-fontsdf/fontsdf.cpp',
    },
}
