local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '33-pom' {
    rootdir = lm.BgfxDir / 'examples/33-pom',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/33-pom/fs_pom.sc',
        shaderc.compile 'examples/33-pom/vs_pom.sc',
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
        'pom.cpp',
    },
}
