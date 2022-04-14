local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '18-ibl' {
    rootdir = lm.BgfxDir / 'examples/18-ibl',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/18-ibl/fs_ibl_mesh.sc',
        shaderc.compile 'examples/18-ibl/fs_ibl_skybox.sc',
        shaderc.compile 'examples/18-ibl/vs_ibl_mesh.sc',
        shaderc.compile 'examples/18-ibl/vs_ibl_skybox.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        geometryc.compile 'examples/assets/meshes/orb.obj',
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
        'ibl.cpp',
    },
}
