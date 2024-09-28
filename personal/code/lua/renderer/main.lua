local SDL = require("SDL")

-- cube
local points = { {-1.0, -1.0, -1.0 }, { -1.0, -1.0, 1.0 },
				{ 1.0, -1.0, -1.0 }, { -1.0, 1.0, -1.0 },
				{ -1.0, 1.0, 1.0 }, { 1.0, -1.0, 1.0 },
				{ 1.0, 1.0, -1.0 }, { 1.0, 1.0, 1.0 } }

local vertices = { { 0, 1 }, { 0, 2 }, { 0, 3 },
				{ 2, 5 }, { 3, 6 }, { 3, 4 },
				{ 4, 7 }, { 6, 7 }, { 7, 5 },
				{ 5, 1 }, { 4, 1 }, { 2, 6 } }

local window = assert(SDL.createWindow {
	title = "3D Renderer",
	width = 960,
	height = 540,
	flags = { SDL.window.Resizeable }
})

local renderer = assert(SDL.createRenderer(window, 0, 0))

local running  = true

while running do
	for e in SDL.pollEvent() do
		if e.type == SDL.event.Quit then
			running = false
		end
	end
end
