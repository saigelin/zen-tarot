local Render = require("renderer.text_render")
local Object = require("libs.classic")
local Text = Object:extend()

function Text:new(msg, x, y, font, color)
    self.msg = msg
    self.x = x
    self.y = y
    if font == "title" then
        self.font = Font.title
    else
        self.font = Font.default
    end
    self.color = color
end

function Text:update(dt)
end

function Text:draw()
    Render:draw(self)
end

return Text
