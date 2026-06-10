local Render = require("renderer.text_render")
local Object = require("libs.classic")
local Text = Object:extend()

function Text:new(msg, x, y)
    self.msg = msg
    self.x = x
    self.y = y
end

function Text:update(dt)
end

function Text:draw()
    Render:draw(self)
end

return Text
