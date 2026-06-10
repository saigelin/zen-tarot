local SceneMgr = require("systems.scene_manager")

function love.load()
    math.randomseed(os.time())
    SceneMgr:load()
end

function love.update(dt)
    SceneMgr:update(dt)
end

function love.draw()
    SceneMgr:draw()
end

function love.keypressed(key)
    print("key pressed", key)
    SceneMgr:keypressed(key)
end

function love.mousepressed(x, y, button)
    print("mouse pressed", x, y, button)
    SceneMgr:mousepressed(x, y, button)
end
