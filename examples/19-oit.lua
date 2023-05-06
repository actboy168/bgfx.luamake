local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'

example_target '19-oit' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/19-oit/fs_oit.sc',
        shaderc.compile 'examples/19-oit/fs_oit_wb.sc',
        shaderc.compile 'examples/19-oit/fs_oit_wb_blit.sc',
        shaderc.compile 'examples/19-oit/fs_oit_wb_separate.sc',
        shaderc.compile 'examples/19-oit/fs_oit_wb_separate_blit.sc',
        shaderc.compile 'examples/19-oit/vs_oit.sc',
        shaderc.compile 'examples/19-oit/vs_oit_blit.sc',
    },
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/19-oit/oit.cpp',
    },
}
