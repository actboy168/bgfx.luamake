local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'

example_target '23-vectordisplay' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/23-vectordisplay/fs_vectordisplay_blit.sc',
        shaderc.compile 'examples/23-vectordisplay/fs_vectordisplay_blur.sc',
        shaderc.compile 'examples/23-vectordisplay/fs_vectordisplay_fb.sc',
        shaderc.compile 'examples/23-vectordisplay/vs_vectordisplay_fb.sc',
    },
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
