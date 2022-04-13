local testfile, cwd = ...

local subprocess = require "bee.subprocess"
local platform = require "bee.platform"
local EXE = platform.OS == "Windows" and ".exe" or ""

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
