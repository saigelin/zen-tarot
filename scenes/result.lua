local Button = require("ui.button")

local Scene = {
    againButton = Button("again", 110, 110, 30, 30)
}

function Scene:init()
end

function Scene:enter(previous, currentCard)
    self.currentCard = currentCard
end

function Scene:update(dt)
    self.againButton:update(dt)
end

function Scene:draw()
    if self.currentCard then
        self.currentCard:draw()
    end
    self.againButton:draw()
end

function Scene:keypressed(key)
    if key == "space" then
        Gamestate.switch(DrawScene)
    end
end

function Scene:mousepressed(x, y, button)
    if button == 1 and self.againButton:isPressed(x, y) then
        Gamestate.switch(DrawScene)
    end
end

return Scene
