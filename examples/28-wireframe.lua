local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

example_target '28-wireframe' {
    rootdir = lm.BgfxDir,
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
    defines = lm.os ~= 'android' and 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/28-wireframe/wireframe.cpp',
    },
}
