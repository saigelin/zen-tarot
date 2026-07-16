local Background = require("ui.background")
local Text = require("ui.text")
local Button = require("ui.button")

local Scene = {
    welcomeText = Text("Welcome to Meditation World", 10, 10, "title"),
    usageText = Text("Please Press 'space' or Click Button to Meditate by Card", 10, 60),
    startButton = Button("start", 10, 110, 30, 30)
}

function Scene:init()
    self.background = Background("assets/images/background.png")
end

function Scene:enter(previous)
    self.startButton:toNormal()
    AudioMgr:playBGM()
end

function Scene:update(dt)
    self.startButton:update(dt)
end

function Scene:draw()
    self.background:draw()
    self.welcomeText:draw()
    self.usageText:draw()
    self.startButton:draw()
end

function Scene:keypressed(key)
    if key == "space" then
        AudioMgr:playSE()
        Gamestate.switch(DrawScene)
    end
end

function Scene:mousepressed(x, y, button)
    if button == 1 and self.startButton:inArea(x, y) then
        AudioMgr:playSE()
        Gamestate.switch(DrawScene)
    end
end

function Scene:mousemoved(x, y)
    self.startButton:mousemoved(x, y)
end

return Scene
