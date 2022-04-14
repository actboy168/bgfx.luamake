local lm = require 'luamake'
local copy = require 'examples.copyfile'

lm:exe '20-nanovg' {
    rootdir = lm.BgfxDir / 'examples/20-nanovg',
    deps = {
        'example-runtime',
        copy.compile 'examples/runtime/font/NotoEmoji-Regular.ttf',
        copy.compile 'examples/runtime/font/droidsans.ttf',
        copy.compile 'examples/runtime/font/entypo.ttf',
        copy.compile 'examples/runtime/font/roboto-bold.ttf',
        copy.compile 'examples/runtime/font/roboto-regular.ttf',
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
        'nanovg.cpp',
    },
}
