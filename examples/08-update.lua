local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '08-update' {
    rootdir = lm.BgfxDir / 'examples/08-update',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/08-update/cs_update.sc',
        shaderc.compile 'examples/08-update/fs_update.sc',
        shaderc.compile 'examples/08-update/fs_update_3d.sc',
        shaderc.compile 'examples/08-update/fs_update_cmp.sc',
        shaderc.compile 'examples/08-update/vs_update.sc',
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
        'update.cpp',
    },
}
