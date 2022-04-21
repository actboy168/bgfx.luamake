local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '38-bloom' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/38-bloom/fs_albedo_output.sc',
        shaderc.compile 'examples/38-bloom/fs_bloom_combine.sc',
        shaderc.compile 'examples/38-bloom/fs_downsample.sc',
        shaderc.compile 'examples/38-bloom/fs_upsample.sc',
        shaderc.compile 'examples/38-bloom/vs_albedo_output.sc',
        shaderc.compile 'examples/38-bloom/vs_deferred_combine.sc',
        shaderc.compile 'examples/38-bloom/vs_fullscreen.sc',
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
        'examples/38-bloom/bloom.cpp',
    },
}
