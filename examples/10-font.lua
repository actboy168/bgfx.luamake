local lm = require 'luamake'
local copy = require 'examples.copyfile'

lm:exe '10-font' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        copy.compile 'examples/runtime/font/bleeding_cowboys.ttf',
        copy.compile 'examples/runtime/font/chp-fire.ttf',
        copy.compile 'examples/runtime/font/droidsans.ttf',
        copy.compile 'examples/runtime/font/five_minutes.otf',
        copy.compile 'examples/runtime/font/fontawesome-webfont.ttf',
        copy.compile 'examples/runtime/font/kenney-icon-font.ttf',
        copy.compile 'examples/runtime/font/mias_scribblings.ttf',
        copy.compile 'examples/runtime/font/ruritania.ttf',
        copy.compile 'examples/runtime/font/signika-regular.ttf',
        copy.compile 'examples/runtime/font/visitor1.ttf',
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
        'examples/10-font/font.cpp',
    },
}
