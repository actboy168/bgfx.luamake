local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '19-oit' {
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
    defines = 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',
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
