local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '38-bloom' {
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
    defines = lm.os ~= 'android' and 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',
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
