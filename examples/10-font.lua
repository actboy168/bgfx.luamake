local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local copy = require 'examples.copyfile'

example_target '10-font' {
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
