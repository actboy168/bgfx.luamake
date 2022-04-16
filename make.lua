local lm = require "luamake"
local fs = require "bee.filesystem"

lm.mode = "debug"
local plat = (function ()
    if lm.os == "windows" then
        if lm.compiler == "msvc" then
            return "msvc"
        end
        return "mingw"
    end
    return lm.os
end)()
lm.builddir = ("build/%s/%s"):format(plat, lm.mode)

if not pcall(require, "env") then
    lm.BgfxDir = lm:path "./bgfx/"
    lm.BxDir = lm:path "./bx/"
    lm.BimgDir = lm:path "./bimg/"
end

lm.cxx = "c++17"

lm.warnings = {
    "error",
    "on"
}

lm.defines = "BX_CONFIG_DEBUG=" .. (lm.mode == "debug" and 1 or 0)

lm.msvc = {
    defines = "_CRT_SECURE_NO_WARNINGS",
    includes = lm.BxDir / "include/compat/msvc",
}

lm.mingw = {
    includes = lm.BxDir / "include/compat/mingw",
}

lm.macos = {
    includes = lm.BxDir / "include/compat/osx",
}

lm.ios = {
    includes = lm.BxDir / "include/compat/ios",
    flags = {
        "-fembed-bitcode",
        "-Wno-unused-function"
    }
}

lm.clang = {
    flags = {
        "-Wno-unknown-warning-option",
        "-Wno-tautological-constant-compare",
        "-Wno-unused-variable",
        "-Wno-unused-but-set-variable"
    }
}

require "core.bx"
require "core.bimg"
require "core.bgfx"

if lm.os == "ios" then
    return
end

require "examples.common"

lm:build "generator" {
    "$luamake", "lua", "examples/generator.lua", lm.BgfxDir,
}

local examples = {}
for file in fs.pairs "examples" do
    local name = file:stem():string()
    local id = name:match "^(%d%d)-"
    if id then
        examples[id] = name
    end
end

if lm.run then
    local test = lm.run
    if test == "on" then
        test = "00"
    end
    test = examples[test] or test

    require("examples."..test)
    lm:build ("run-"..test) {
        "$luamake", "lua", "run.lua", "$bin/"..test,
        deps = test,
    }
    lm:default { "run-"..test }
else
    local targets = {}
    for _, test in pairs(examples) do
        require("examples."..test)
        targets[#targets+1] = test
    end
    lm:default(targets)
end
