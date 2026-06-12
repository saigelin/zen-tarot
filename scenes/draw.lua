local Card = require("ui.card")
local Button = require("ui.button")
local cardData = require("data.cards")
local Deck = require("core.deck")
local Timer = require("libs.hump.timer")
local UI = require("core.ui")

local sceneState = {
    IDLE = 0,
    ANIMATING = 1
}
local Scene = {
    cardBack = Card(0, "card back", "card back msg", nil),
    drawButton = Button("draw", 60, 110, 30, 30),
    frames = {}
}

function Scene:init()
    Deck:load(cardData)

    self.timer = Timer.new()

    self.image = love.graphics.newImage("assets/images/reveal.png")
    local width = self.image:getWidth()
    local height = self.image:getHeight()
    local frame_width = 117
    local frame_height = 233
    local maxFrames = 5
    for i = 0, 1 do
        for j = 0, 2 do
            table.insert(self.frames,
                love.graphics.newQuad(1 + j * (frame_width + 2), 1 + i * (frame_height + 2), frame_width, frame_height,
                    width, height))
            if #self.frames == maxFrames then
                break
            end
        end
    end

    self:toIdle()
end

function Scene:enter(previous)
    self:toIdle()
end

function Scene:update(dt)
    self.drawButton:update(dt)
    self.timer:update(dt)
end

function Scene:draw()
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
        Gamestate.switch(ResultScene, Deck:drawCard())
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

    self:toAnimating()
end

function Scene:keypressed(key)
    if key == "space" then
        self:startReveal()
    end
end

function Scene:mousepressed(x, y, button)
    if button == 1 and self.drawButton:isPressed(x, y) then
        self:startReveal()
    end
end

return Scene
