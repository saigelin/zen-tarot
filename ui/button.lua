local Render = require("renderer.button_render")
local Object = require("libs.classic")
local Button = Object:extend()

local color = {
    normal = { r = 0.5, g = 0.5, b = 0.5 },
    hover = { r = 0.75, g = 0.75, b = 0.75 }
}

function Button:toNormal()
    self.isHovered = false
    self.color = color.normal
end

function Button:toHover()
    self.isHovered = true
    self.color = color.hover
end

function Button:new(name, x, y, w, h)
    self.name = name
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.font = Font.default
    self:toNormal()
end

function Button:inArea(x, y)
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

function Button:mousemoved(x, y)
    if self:inArea(x, y) then
        self:toHover()
    else
        self:toNormal()
    end
end

return Button
