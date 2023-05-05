local lm = require 'luamake'
local copy = require 'examples.copyfile'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '11-fontsdf' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        copy.compile 'examples/runtime/font/special_elite.ttf',
        copy.compile 'examples/runtime/text/sherlock_holmes_a_scandal_in_bohemia_arthur_conan_doyle.txt',
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
        'examples/11-fontsdf/fontsdf.cpp',
    },
}
