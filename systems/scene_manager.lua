local titleScene = require("scenes.title")
local drawScene = require("scenes.draw")
local resultScene = require("scenes.result")
local cardData = require("data.cards")
local Deck = require("core.deck")

local Manager = {
    currentScene = titleScene,
    currentCard = nil
}

function Manager:changeScene(scene)
    if self.currentScene.exit then
        self.currentScene:exit()
    end

    if scene == "draw" then
        self.currentScene = drawScene
    else
        self.currentScene = resultScene
    end

    if self.currentScene.enter then
        self.currentScene:enter()
    end
end

function Manager:drawCard()
    self.currentCard = Deck:drawCard()
end

function Manager:load()
    Deck:load(cardData)
end

function Manager:update(dt)
    self.currentScene:update(dt)
end

function Manager:draw()
    self.currentScene:draw(self.currentCard)
end

function Manager:keypressed(key)
    self.currentScene:keypressed(key, self)
end

function Manager:mousepressed(x, y, button)
    self.currentScene:mousepressed(x, y, button, self)
end

return Manager
