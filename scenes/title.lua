local Text = require("ui.text")
local Button = require("ui.button")

local Scene = {
    welcomeText = Text("Welcome to Meditation World", 10, 10),
    usageText = Text("Please Press 'space' or Click to Meditate by Card", 10, 60),
    startButton = Button("start", 10, 110, 30, 30)
}

function Scene:load()
end

function Scene:update(dt)
    self.startButton:update(dt)
end

function Scene:draw(card)
    self.welcomeText:draw()
    self.usageText:draw()
    self.startButton:draw()
end

function Scene:keypressed(key, sceneManger)
    if key == "space" then
        sceneManger:changeScene("draw")
    end
end

function Scene:mousepressed(x, y, button, sceneManger)
    if button == 1 and self.startButton:isPressed(x, y) then
        sceneManger:changeScene("draw")
    end
end

return Scene
