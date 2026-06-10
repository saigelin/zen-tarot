local Render = require("renderer.button_render")
local Object = require("libs.classic")
local Button = Object:extend()

function Button:new(name, x, y, w, h)
    self.name = name
    self.x = x
    self.y = y
    self.w = w
    self.h = h
end

function Button:isPressed(x, y)
    if x >= self.x and x <= (self.x + self.w) and y >= self.y and y <= (self.y + self.h) then
        return true
    end
    return false
end

function Button:update(dt)
end

function Button:draw()
    Render:draw(self)
end

return Button
