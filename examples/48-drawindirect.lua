local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'

example_target '48-drawindirect' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/48-drawindirect/cs_drawindirect.sc',
        shaderc.compile 'examples/48-drawindirect/cs_drawindirect_count.sc',
    },
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
