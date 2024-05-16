# bgfx.luamake

Build [bgfx](https://github.com/bkaradzic/bgfx) with [luamake](https://github.com/actboy168/luamake).

### Use

> luamake generator

Run example
> luamake --run 00

Or
> luamake --run 00-helloworld

Specify renderer
> luamake --run 00 -vk


| renderer   | args   |
| ---------- | ------ |
| noop       | -noop  |
| direct3d11 | -d3d11 |
| direct3d12 | -d3d12 |
| vulken     | -vk    |
| metal      | -mtl   |
| opengl     | -gl    |
