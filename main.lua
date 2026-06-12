Gamestate = require("libs.hump.gamestate")
TitleScene = require("scenes.title")
DrawScene = require("scenes.draw")
ResultScene = require("scenes.result")

function love.load()
    math.randomseed(os.time())
    Gamestate.registerEvents()
    Gamestate.switch(TitleScene)
end

function love.update(dt)
end

function love.draw()
end

function love.keypressed(key)
    print("key pressed", key)
end

function love.mousepressed(x, y, button)
    print("mouse pressed", x, y, button)
end
