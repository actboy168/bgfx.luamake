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

example_target '30-picking' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/30-picking/fs_picking_id.sc',
        shaderc.compile 'examples/30-picking/fs_picking_shaded.sc',
        shaderc.compile 'examples/30-picking/vs_picking_shaded.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        geometryc.compile 'examples/assets/meshes/column.obj',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/hollowcube.obj',
        geometryc.compile 'examples/assets/meshes/orb.obj',
        geometryc.compile 'examples/assets/meshes/tree.obj',
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
        'examples/30-picking/picking.cpp',
    },
}
