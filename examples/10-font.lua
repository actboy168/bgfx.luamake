local lm = require 'luamake'
local font = require 'examples.font'

lm:exe '10-font' {
    rootdir = lm.BgfxDir / 'examples/10-font',
    deps = {
        'example-runtime',
        font.compile 'examples/runtime/font/bleeding_cowboys.ttf',
        font.compile 'examples/runtime/font/chp-fire.ttf',
        font.compile 'examples/runtime/font/droidsans.ttf',
        font.compile 'examples/runtime/font/five_minutes.otf',
        font.compile 'examples/runtime/font/fontawesome-webfont.ttf',
        font.compile 'examples/runtime/font/kenney-icon-font.ttf',
        font.compile 'examples/runtime/font/mias_scribblings.ttf',
        font.compile 'examples/runtime/font/ruritania.ttf',
        font.compile 'examples/runtime/font/signika-regular.ttf',
        font.compile 'examples/runtime/font/visitor1.ttf',
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
        'font.cpp',
    },
}
