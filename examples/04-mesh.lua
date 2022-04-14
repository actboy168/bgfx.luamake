local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '04-mesh' {
    rootdir = lm.BgfxDir / 'examples/04-mesh',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/04-mesh/fs_mesh.sc',
        shaderc.compile 'examples/04-mesh/vs_mesh.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
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
        'mesh.cpp',
    },
}
