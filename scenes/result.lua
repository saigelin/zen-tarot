local Button = require("ui.button")

local Scene = {
    againButton = Button("again", 110, 110, 30, 30)
}

function Scene:load()
end

function Scene:update(dt)
    self.againButton:update(dt)
end

function Scene:draw(card)
    if card then
        card:draw()
    end
    self.againButton:draw()
end

function Scene:keypressed(key, sceneManger)
    if key == "space" then
        sceneManger:changeScene("draw")
    end
end

function Scene:mousepressed(x, y, button, sceneManger)
    if button == 1 and self.againButton:isPressed(x, y) then
        sceneManger:changeScene("draw")
    end
end

return Scene
