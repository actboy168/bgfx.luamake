local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '48-drawindirect' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/48-drawindirect/cs_drawindirect.sc',
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
        'examples/48-drawindirect/drawindirect.cpp',
    },
}
