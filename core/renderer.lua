local Render = {}

function Render:drawText(uiText)
    love.graphics.print(uiText.msg, uiText.x, uiText.y)
end

function Render:drawButton(uiButton)
    local w = uiButton.w
    local h = uiButton.h
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.rectangle("line", uiButton.x, uiButton.y, w, h)
    w = w - 1
    h = h - 1
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", uiButton.x, uiButton.y, w, h)

    love.graphics.setColor(1, 1, 1, 1)
end

function Render:drawCard(uiCard, card)
    if not card then
        return
    end
    local y = uiCard.y
    if card.image == nil then
        love.graphics.print(card.name, uiCard.x, y)
        y = y + 10
    else
        love.graphics.draw(card.image, uiCard.x, y)
        local h = card.image:getHeight()
        y = y + h + 10
    end
    love.graphics.print(card.message, uiCard.x, y)
end

return Render
