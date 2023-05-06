local lm = require 'luamake'
local example_target = require 'examples.util'.example_target

example_target '34-mvs' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
    },
    defines = lm.os ~= 'android' and 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/34-mvs/mvs.cpp',
    },
}
