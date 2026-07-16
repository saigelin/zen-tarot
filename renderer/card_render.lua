local Render = {}

function Render:draw(uiCard, card)
    if not card then
        return
    end
    local x = uiCard.x
    local y = uiCard.y
    local cardWidth = uiCard.w
    local cardHeight = uiCard.h
    love.graphics.setFont(card.font)
    if card.image == nil then
        love.graphics.print(card.name, x, y)
    else
        local imageWidth = card.image:getWidth()
        local imageHeight = card.image:getHeight()
        local sx = cardWidth / imageWidth
        local sy = cardHeight / imageHeight
        love.graphics.draw(card.image, x, y, 0, sx, sy)
    end
    x = x + cardWidth + 50
    love.graphics.print(card.message, x, y)
    y = y + 50
    love.graphics.print(card.description, x, y)
end

return Render
