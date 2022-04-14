local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '17-drawstress' {
    rootdir = lm.BgfxDir / 'examples/17-drawstress',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/17-drawstress/fs_drawstress.sc',
        shaderc.compile 'examples/17-drawstress/vs_drawstress.sc',
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
        'drawstress.cpp',
    },
}
