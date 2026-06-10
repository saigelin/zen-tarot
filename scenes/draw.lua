local Card = require("ui.card")
local Button = require("ui.button")

local Scene = {
    cardBack = Card(0, "card back", "card back msg", nil),
    drawButton = Button("draw", 60, 110, 30, 30)
}

function Scene:exit()
end

function Scene:enter()
end

function Scene:load()
end

function Scene:update(dt)
    self.drawButton:update(dt)
end

function Scene:draw(card)
    self.cardBack:draw()
    self.drawButton:draw()
end

function Scene:keypressed(key, sceneManger)
    if key == "space" then
        sceneManger:drawCard()
        sceneManger:changeScene("result")
    end
end

function Scene:mousepressed(x, y, button, sceneManger)
    if button == 1 and self.drawButton:isPressed(x, y) then
        sceneManger:drawCard()
        sceneManger:changeScene("result")
    end
end

return Scene
