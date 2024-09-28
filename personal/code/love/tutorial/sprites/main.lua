function love.load()
    anim8 = require 'libraries/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")

    sti = require 'libraries/sti'
    gameMap = sti('maps/TestMap.lua')

    camera = require 'libraries/camera'
    cam = camera()

    wf = require 'libraries/windfield'
    world = wf.newWorld(0, 0)

    player = {}
    player.x = 400
    player.y = 200
    player.collider = world:newBSGRectangleCollider(400, 250, 50, 100, 10)
    player.collider:setFixedRotation(true)
    player.speed = 300
    player.sprite = love.graphics.newImage('sprites/player.png')
    background = love.graphics.newImage('sprites/background.png')
    player.spriteSheet = love.graphics.newImage('sprites/spritesheet.png')
    player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    player.animations = {}
    player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2)
    player.animations.left = anim8.newAnimation( player.grid('1-4', 2), 0.2)
    player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2)
    player.animations.up = anim8.newAnimation( player.grid('1-4', 4), 0.2)

    player.anim = player.animations.left
    
    walls = {}
    if gameMap.layers["Walls"] then
        for i, obj in pairs(gameMap.layers["Walls"].objects) do
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setType('static')
            table.insert(walls, wall)
        end
    end


end

function love.update(dt)
    local isMoving = false

    local vx = 0;
    local vy = 0;

    if love.keyboard.isDown("right") then
        isMoving = true
        player.anim = player.animations.right
        vx = player.speed;
    end

    if love.keyboard.isDown("left") then
        isMoving = true
        player.anim = player.animations.left
        vx = player.speed * -1
    end

    if love.keyboard.isDown("up") then
        isMoving = true
        player.anim = player.animations.up
        vy = player.speed * -1
    end

    if love.keyboard.isDown("down") then
        isMoving = true
        player.anim = player.animations.down
        vy = player.speed
    end

    player.collider:setLinearVelocity(vx, vy)

    if isMoving == false then
        player.anim:gotoFrame(2)
    end

    world:update(dt)
    player.x = player.collider:getX()
    player.y = player.collider:getY()

    player.anim:update(dt)

    cam:lookAt(player.x, player.y)
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    if cam.x < w/2 then
        cam.x = w/2
    end

    if cam.y < h/2 then
        cam.y = h/2
    end

    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight

    if cam.x > (mapW - w/2) then
        cam.x = (mapW - w/2)
    end

    if cam.y > (mapH - h/2) then
        cam.y = (mapH - h/2)
    end
end

function love.draw()
    cam:attach()
        gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
        gameMap:drawLayer(gameMap.layers["Trees"])
        player.anim:draw(player.spriteSheet, player.x, player.y, nil, 6, nil, 6, 9)
    cam:detach()
end
