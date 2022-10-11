local lm = require "luamake"
local fs = require "bee.filesystem"

lm.compile_commands = "build"
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

require "common"
require "core.bx"
require "core.bimg"
require "core.bgfx"
require "examples.common"

lm:runlua "generator" {
    script = "examples/generator.lua",
    args = { lm.BgfxDir },
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
    lm:runlua ("run-"..test) {
        script = "run.lua",
        args = { "$bin/"..test },
        deps = test,
    }
    lm:default { "run-"..test }
else
    local function sortpairs(t)
        local sort = {}
        for k in pairs(t) do
            sort[#sort+1] = k
        end
        table.sort(sort)
        local n = 1
        return function ()
            local k = sort[n]
            if k == nil then
                return
            end
            n = n + 1
            return k, t[k]
        end
    end
    local targets = {}
    for _, test in sortpairs(examples) do
        require("examples."..test)
        targets[#targets+1] = test
    end
    lm:default(targets)
end
