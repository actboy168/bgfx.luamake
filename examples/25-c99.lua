local lm = require 'luamake'
local example_target = require 'examples.util'.example_target

example_target '25-c99' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
    },
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/25-c99/helloworld.c',
    },
}
