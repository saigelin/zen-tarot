local Background = require("ui.background")
local Text = require("ui.text")
local Button = require("ui.button")
local Theme = require("core.theme")

local Scene = {
    settingsText = Text("Settings", 10, 10, "title", Theme.textColor),
    musicText = Text("Music", 10, 60, "text", Theme.textColor),
    switchBGMButton = Button("off", 60, 60, 30, 30, Theme.buttonColor, Theme.buttonHoverColor, Theme.buttonBorderColor, Theme.buttonTextColor),
    backButton = Button("back", 10, 110, 30, 30, Theme.buttonColor, Theme.buttonHoverColor, Theme.buttonBorderColor, Theme.buttonTextColor)
}

function Scene:init()
    self.background = Background(Theme.backgroundImage)
end

function Scene:enter(previous)
    self.switchBGMButton:toNormal()
    self.backButton:toNormal()
end

function Scene:update(dt)
    self.switchBGMButton:update(dt)
    self.backButton:update(dt)
end

function Scene:draw()
    self.background:draw()
    self.settingsText:draw()
    self.musicText:draw()
    self.switchBGMButton:draw()
    self.backButton:draw()
end

function Scene:mousepressed(x, y, button)
    if button == 1 then
        if self.backButton:inArea(x, y) then
            AudioMgr:playSE()
            Gamestate.switch(TitleScene)
        elseif self.switchBGMButton:inArea(x, y) then
            AudioMgr:playSE()
            if Config:toggleBGM() then
                self.switchBGMButton:setName("off")
                AudioMgr:playBGM()
            else
                self.switchBGMButton:setName("on")
                AudioMgr:stopBGM()
            end
        end
    end
end

function Scene:mousemoved(x, y)
    self.switchBGMButton:mousemoved(x, y)
    self.backButton:mousemoved(x, y)
end

return Scene
