local testfile = ...

local subprocess = require "bee.subprocess"
local platform = require "bee.platform"
local fs = require "bee.filesystem"
local EXE = platform.OS == "Windows" and ".exe" or ""

local cwd = fs.path(testfile):parent_path()
fs.create_directories(cwd / "temp")

local process = assert(subprocess.spawn {
    testfile..EXE,
    cwd = cwd,
    stdout = true,
    stderr = "stdout",
})

for line in process.stdout:lines() do
    io.write(line, "\n")
    io.flush()
end
process.stdout:close()

local code = process:wait()
if code ~= 0 then
    os.exit(code, true)
end
