local Background = require("ui.background")
local Card = require("ui.card")
local Button = require("ui.button")
local cardData = require("data.cards")
local CardMgr = require("systems.card_manager")
local Timer = require("libs.hump.timer")
local UI = require("core.ui")
local Theme = require("core.theme")

local sceneState = {
    IDLE = 0,
    ANIMATING = 1
}
local cardBackData = {
    id = -1,
    name = "card back",
    message = "",
    description = "",
    imagePath = Theme.cardBackImage
}
local Scene = {
    cardBack = Card(cardBackData, Theme.textColor),
    drawButton = Button("draw", 10, 160, 30, 30, Theme.buttonColor, Theme.buttonHoverColor, Theme.buttonBorderColor, Theme.buttonTextColor)
}

function Scene:init()
    CardMgr:load(cardData, Theme.textColor)

    self.background = Background(Theme.backgroundImage)

    self.timer = Timer.new()

    self.frames = {}
    self.image = love.graphics.newImage(Theme.revealImage)
    local width = self.image:getWidth()
    local height = self.image:getHeight()
    local frame_width = 256
    local frame_height = 512
    local maxFrames = 5
    for j = 0, 5 do
        table.insert(self.frames,
            love.graphics.newQuad(33 + j * (frame_width + 44), 278, frame_width, frame_height,
                width, height))
        if #self.frames == maxFrames then
            break
        end
    end

    self:toIdle()
end

function Scene:enter(previous)
    self.drawButton:toNormal()
    AudioMgr:playBGM()
    self:toIdle()
end

function Scene:update(dt)
    self.drawButton:update(dt)
    self.timer:update(dt)
end

function Scene:draw()
    self.background:draw()
    if self.state == sceneState.IDLE then
        self.cardBack:draw()
        self.drawButton:draw()
    else
        local cardLayout = UI:getCardLayout()
        love.graphics.draw(self.image, self.frames[self.currentFrame], cardLayout.x, cardLayout.y)
    end
end

function Scene:toIdle()
    self.state = sceneState.IDLE
    self.currentFrame = 0
    self.timer:clear()
end

function Scene:toAnimating()
    self.state = sceneState.ANIMATING
    self.currentFrame = 1
    self.timer:every(0.15, function()
        self:nextFrame()
    end, 4)
    self.timer:after(0.15 * 5, function()
        Gamestate.switch(ResultScene, self.currentCard)
    end)
end

function Scene:nextFrame()
    self.currentFrame = math.min(
        self.currentFrame + 1,
        #self.frames
    )
end

function Scene:startReveal()
    if self.state ~= sceneState.IDLE then
        return
    end

    self.currentCard = CardMgr:drawCard()
    self:toAnimating()
end

function Scene:keypressed(key)
    if key == "space" then
        AudioMgr:playSE()
        self:startReveal()
    end
end

function Scene:mousepressed(x, y, button)
    if button == 1 and self.drawButton:inArea(x, y) then
        AudioMgr:playSE()
        self:startReveal()
    end
end

function Scene:mousemoved(x, y)
    self.drawButton:mousemoved(x, y)
end

return Scene
