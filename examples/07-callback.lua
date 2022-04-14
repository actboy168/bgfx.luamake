local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '07-callback' {
    rootdir = lm.BgfxDir / 'examples/07-callback',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/07-callback/fs_callback.sc',
        shaderc.compile 'examples/07-callback/vs_callback.sc',
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
        'callback.cpp',
    },
    msvc = {
        defines = '__STDC_FORMAT_MACROS'
    }
}
