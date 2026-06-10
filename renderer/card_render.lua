local Render = {}

function Render:draw(uiCard, card)
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
