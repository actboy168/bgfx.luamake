local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '02-metaballs' {
    rootdir = lm.BgfxDir / 'examples/02-metaballs',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/02-metaballs/fs_metaballs.sc',
        shaderc.compile 'examples/02-metaballs/vs_metaballs.sc',
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
        'metaballs.cpp',
    },
}
