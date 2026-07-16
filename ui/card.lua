local UI = require("core.ui")
local Render = require("renderer.card_render")
local Object = require("libs.classic")
local Card = Object:extend()

function Card:new(data)
    self.id = data.id
    self.name = data.name
    self.message = data.message
    self.description = data.description
    if data.imagePath then
        self.image = love.graphics.newImage(data.imagePath)
    else
        self.image = nil
    end
    self.font = Font.default
end

function Card:update(dt)
end

function Card:draw()
    local cardLayout = UI:getCardLayout()
    Render:draw(cardLayout, self)
end

return Card
