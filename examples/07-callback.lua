local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '07-callback' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/07-callback/fs_callback.sc',
        shaderc.compile 'examples/07-callback/vs_callback.sc',
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
        'examples/07-callback/callback.cpp',
    },
    msvc = {
        defines = '__STDC_FORMAT_MACROS'
    }
}
