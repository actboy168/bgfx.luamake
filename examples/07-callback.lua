local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'

example_target '07-callback' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/07-callback/fs_callback.sc',
        shaderc.compile 'examples/07-callback/vs_callback.sc',
    },
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/07-callback/callback.cpp',
    },
    msvc = {
        defines = '__STDC_FORMAT_MACROS'
    }
}
