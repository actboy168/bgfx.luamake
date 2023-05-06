local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

example_target '04-mesh' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/04-mesh/fs_mesh.sc',
        shaderc.compile 'examples/04-mesh/vs_mesh.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
    },
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/04-mesh/mesh.cpp',
    },
}
