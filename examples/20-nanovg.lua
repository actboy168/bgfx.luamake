local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local copy = require 'examples.copyfile'

example_target '20-nanovg' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        copy.compile 'examples/runtime/font/NotoEmoji-Regular.ttf',
        copy.compile 'examples/runtime/font/droidsans.ttf',
        copy.compile 'examples/runtime/font/entypo.ttf',
        copy.compile 'examples/runtime/font/roboto-bold.ttf',
        copy.compile 'examples/runtime/font/roboto-regular.ttf',
    },
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/20-nanovg/nanovg.cpp',
    },
}
