local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'

example_target '05-instancing' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/05-instancing/fs_instancing.sc',
        shaderc.compile 'examples/05-instancing/vs_instancing.sc',
    },
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/05-instancing/instancing.cpp',
    },
}
