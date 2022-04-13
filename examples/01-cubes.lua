local lm = require "luamake"
local shader = require "examples.shader"

shader.compile {
    path = "examples/01-cubes/",
    name = "cubes",
}

lm:exe "01-cubes" {
    rootdir = lm.BgfxDir / "examples/01-cubes",
    deps = {
        "example-runtime",
        "shader-cubes",
    },
    defines = "ENTRY_CONFIG_IMPLEMENT_MAIN=1",
    includes = {
        lm.BxDir / "include",
        lm.BimgDir / "include",
        lm.BgfxDir / "include",
        lm.BgfxDir / "examples/common",
        lm.BgfxDir / "3rdparty",
    },
    sources = {
        "cubes.cpp"
    }
}
