local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '06-bump' {
    rootdir = lm.BgfxDir / 'examples/06-bump',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/06-bump/fs_bump.sc',
        shaderc.compile 'examples/06-bump/vs_bump.sc',
        shaderc.compile 'examples/06-bump/vs_bump_instanced.sc',
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
        'bump.cpp',
    },
}
