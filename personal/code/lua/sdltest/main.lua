-- Load SDL
local SDL = require("SDL")

-- Load the image module
local image = require("SDL.image")

-- Initialize video and audio
assert(SDL.init{
	SDL.flags.Video,
	SDL.flags.Audio,
})

-- Print the SDL version
print(string.format("SDL %d.%d.%d",
    SDL.VERSION_MAJOR,
    SDL.VERSION_MINOR,
    SDL.VERSION_PATCH
))

-- Initialize a window
local win = assert(SDL.createWindow{
	title = "2 - Opening a window",
	width = 600,
	height = 600,
	flags = { SDL.window.Resizeable}
})

-- Initialize the image module
local formats, ret, err = image.init{ image.flags.PNG}
if not formats[image.flags.PNG] then
	error(err)
end

-- Load an image
local img = assert(image.load("Ground1.png"))

-- Creating a renderer to render the image
local rdr = assert(SDL.createRenderer(win, 0, 0))

-- We need to cenvert the image to a texture before rendering
img = rdr:createTextureFromSurface(img)

-- Set the background color to black
rdr:setDrawColor(0xFFFFFF)
rdr:clear()

-- Copy the image to the renderer
rdr:copy(img)

-- Show the updated renderer
rdr:present()

local running = true
while running do
	for e in SDL.pollEvent() do
		if e.type == SDL.event.KeyDown then
			running = false
		end
	end
end

SDL.quit()
