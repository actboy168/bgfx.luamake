local lm = require 'luamake'
local copy = require 'examples.copyfile'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '20-nanovg' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        copy.compile 'examples/runtime/font/NotoEmoji-Regular.ttf',
        copy.compile 'examples/runtime/font/droidsans.ttf',
        copy.compile 'examples/runtime/font/entypo.ttf',
        copy.compile 'examples/runtime/font/roboto-bold.ttf',
        copy.compile 'examples/runtime/font/roboto-regular.ttf',
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
        'examples/20-nanovg/nanovg.cpp',
    },
}
