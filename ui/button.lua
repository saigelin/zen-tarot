local Render = require("renderer.button_render")
local Object = require("libs.classic")
local Button = Object:extend()

function Button:toNormal()
    self.isHovered = false
    self.color = self.normalColor
end

function Button:toHover()
    self.isHovered = true
    self.color = self.hoverColor
end

function Button:new(name, x, y, w, h, normalColor, hoverColor, borderColor, textColor)
    self.name = name
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.font = Font.default
    self.normalColor = normalColor
    self.hoverColor = hoverColor
    self.borderColor = borderColor
    self.textColor = textColor
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
