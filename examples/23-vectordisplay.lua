local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '23-vectordisplay' {
    rootdir = lm.BgfxDir / 'examples/23-vectordisplay',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/23-vectordisplay/fs_vectordisplay_blit.sc',
        shaderc.compile 'examples/23-vectordisplay/fs_vectordisplay_blur.sc',
        shaderc.compile 'examples/23-vectordisplay/fs_vectordisplay_fb.sc',
        shaderc.compile 'examples/23-vectordisplay/vs_vectordisplay_fb.sc',
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
        'main.cpp',
        'vectordisplay.cpp',
    },
}
