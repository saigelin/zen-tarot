local Object = require("libs.classic")
local Card = Object:extend()

function Card:new(id, name, message, imagePath)
    self.id = id
    self.name = name
    self.message = message
    if imagePath then
        self.image = love.graphics.newImage(imagePath)
    else
        self.image = nil
    end
end

return Card
