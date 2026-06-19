local Render = require("renderer.background_render")
local Object = require("libs.classic")
local Background = Object:extend()

function Background:new(imagePath)
    if imagePath then
        self.image = love.graphics.newImage(imagePath)
    else
        self.image = nil
    end
end

function Background:update(dt)
end

function Background:draw()
    Render:draw(self)
end

return Background
