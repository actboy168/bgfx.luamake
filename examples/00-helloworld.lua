local lm = require "luamake"

lm:exe "00-helloworld" {
    rootdir = lm.BgfxDir / "examples/00-helloworld",
    deps = {
        "example-runtime",
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
        "helloworld.cpp"
    }
}
