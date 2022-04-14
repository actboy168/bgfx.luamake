local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '12-lod' {
    rootdir = lm.BgfxDir / 'examples/12-lod',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/12-lod/fs_tree.sc',
        shaderc.compile 'examples/12-lod/vs_tree.sc',
        geometryc.compile 'examples/assets/meshes/tree1b_lod0_1.obj',
        geometryc.compile 'examples/assets/meshes/tree1b_lod0_2.obj',
        geometryc.compile 'examples/assets/meshes/tree1b_lod1_1.obj',
        geometryc.compile 'examples/assets/meshes/tree1b_lod1_2.obj',
        geometryc.compile 'examples/assets/meshes/tree1b_lod2_1.obj',
        geometryc.compile 'examples/assets/meshes/tree1b_lod2_2.obj',
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
        'lod.cpp',
    },
}
