local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local texturec = require 'examples.texturec'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '33-pom' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/33-pom/fs_pom.sc',
        shaderc.compile 'examples/33-pom/vs_pom.sc',
        texturec.compile 'examples/runtime/textures/parallax-d.ktx',
        texturec.compile 'examples/runtime/textures/parallax-h.ktx',
        texturec.compile 'examples/runtime/textures/parallax-n.ktx',
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
        'examples/33-pom/pom.cpp',
    },
}
