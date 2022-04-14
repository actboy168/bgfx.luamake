local lm = require 'luamake'
local font = require 'examples.font'

lm:exe '20-nanovg' {
    rootdir = lm.BgfxDir / 'examples/20-nanovg',
    deps = {
        'example-runtime',
        font.compile 'examples/runtime/font/NotoEmoji-Regular.ttf',
        font.compile 'examples/runtime/font/droidsans.ttf',
        font.compile 'examples/runtime/font/entypo.ttf',
        font.compile 'examples/runtime/font/roboto-bold.ttf',
        font.compile 'examples/runtime/font/roboto-regular.ttf',
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
