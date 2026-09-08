local Render = {}

function Render:draw(uiText)
    love.graphics.setColor(uiText.color.r, uiText.color.g, uiText.color.b)
    love.graphics.setFont(uiText.font)
    love.graphics.print(uiText.msg, uiText.x, uiText.y)
    love.graphics.setColor(1, 1, 1, 1)
end

return Render
