local Background = require("ui.background")
local Text = require("ui.text")
local Button = require("ui.button")
local Theme = require("core.theme")

local Scene = {
    welcomeText = Text("Welcome to Meditation World", 10, 10, "title", Theme.textColor),
    usageText = Text("Please Press 'space' or Click Button to Meditate by Card", 10, 60, "text", Theme.textColor),
    startButton = Button("start", 10, 110, 30, 30, Theme.buttonColor, Theme.buttonHoverColor, Theme.buttonBorderColor, Theme.buttonTextColor),
    settingsButton = Button("set", 10, 160, 30, 30, Theme.buttonColor, Theme.buttonHoverColor, Theme.buttonBorderColor, Theme.buttonTextColor)
}

function Scene:init()
    self.background = Background(Theme.backgroundImage)
end

function Scene:enter(previous)
    self.startButton:toNormal()
    self.settingsButton:toNormal()
    if Config:getBGM() then
        AudioMgr:playBGM()
    else
        AudioMgr:stopBGM()
    end
end

function Scene:update(dt)
    self.startButton:update(dt)
    self.settingsButton:update(dt)
end

function Scene:draw()
    self.background:draw()
    self.welcomeText:draw()
    self.usageText:draw()
    self.startButton:draw()
    self.settingsButton:draw()
end

function Scene:keypressed(key)
    if key == "space" then
        AudioMgr:playSE()
        Gamestate.switch(DrawScene)
    end
end

function Scene:mousepressed(x, y, button)
    if button == 1 then
        if self.startButton:inArea(x, y) then
            AudioMgr:playSE()
            Gamestate.switch(DrawScene)
        elseif self.settingsButton:inArea(x, y) then
            AudioMgr:playSE()
            Gamestate.switch(SettingsScene)
        end
    end
end

function Scene:mousemoved(x, y)
    self.startButton:mousemoved(x, y)
    self.settingsButton:mousemoved(x, y)
end

return Scene
