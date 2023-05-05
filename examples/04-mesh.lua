local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '04-mesh' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/04-mesh/fs_mesh.sc',
        shaderc.compile 'examples/04-mesh/vs_mesh.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
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
        'examples/04-mesh/mesh.cpp',
    },
}
