local Background = require("ui.background")
local Button = require("ui.button")
local Theme = require("core.theme")

local Scene = {
    againButton = Button("again", 10, 210, 30, 30, Theme.buttonColor, Theme.buttonHoverColor, Theme.buttonBorderColor, Theme.buttonTextColor)
}

function Scene:init()
    self.background = Background(Theme.backgroundImage)
end

function Scene:enter(previous, currentCard)
    self.currentCard = currentCard
    self.againButton:toNormal()
    AudioMgr:playBGM()
end

function Scene:update(dt)
    self.againButton:update(dt)
end

function Scene:draw()
    self.background:draw()
    if self.currentCard then
        self.currentCard:draw()
    end
    self.againButton:draw()
end

function Scene:keypressed(key)
    if key == "space" then
        AudioMgr:playSE()
        Gamestate.switch(DrawScene)
    end
end

function Scene:mousepressed(x, y, button)
    if button == 1 and self.againButton:inArea(x, y) then
        AudioMgr:playSE()
        Gamestate.switch(DrawScene)
    end
end

function Scene:mousemoved(x, y)
    self.againButton:mousemoved(x, y)
end

return Scene
