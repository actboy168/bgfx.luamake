local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '23-vectordisplay' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/23-vectordisplay/fs_vectordisplay_blit.sc',
        shaderc.compile 'examples/23-vectordisplay/fs_vectordisplay_blur.sc',
        shaderc.compile 'examples/23-vectordisplay/fs_vectordisplay_fb.sc',
        shaderc.compile 'examples/23-vectordisplay/vs_vectordisplay_fb.sc',
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
        'examples/23-vectordisplay/main.cpp',
        'examples/23-vectordisplay/vectordisplay.cpp',
    },
}
