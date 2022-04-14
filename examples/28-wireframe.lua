local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '28-wireframe' {
    rootdir = lm.BgfxDir / 'examples/28-wireframe',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/28-wireframe/fs_wf_mesh.sc',
        shaderc.compile 'examples/28-wireframe/fs_wf_wireframe.sc',
        shaderc.compile 'examples/28-wireframe/vs_wf_mesh.sc',
        shaderc.compile 'examples/28-wireframe/vs_wf_wireframe.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        geometryc.compile 'examples/assets/meshes/hollowcube.obj',
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
        'wireframe.cpp',
    },
}
