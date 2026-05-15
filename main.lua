local State = require("core.state")
local UI = require("core.ui")
local Render = require("core.renderer")
local cardData = require("data.cards")
local Deck = require("core.deck")

local function startDraw()
    Deck:drawCard()
    State:toResult()
end

function love.load()
    math.randomseed(os.time())
    Deck:load(cardData)
end

function love.update(dt)
end

function love.draw()
    if State:isIdle() then
        local uiText = UI:getWelcome()
        Render:drawText(uiText)
        uiText = UI:getUsage()
        Render:drawText(uiText)
        local uiButton = UI:getButton()
        Render:drawButton(uiButton)
    else
        local uiCard = UI:getCard()
        local card = Deck:getCard()
        Render:drawCard(uiCard, card)
    end
end

function love.keypressed(key)
    print("key pressed", key)
    if key == "space" then
        startDraw()
    end
end

function love.mousepressed(x, y, button)
    print("mouse pressed", x, y, button)
    if button == 1 and UI:isButtonPressed(x, y) then
        startDraw()
    end
end
