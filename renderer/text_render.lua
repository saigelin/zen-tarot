local Render = {}

function Render:draw(uiText)
    love.graphics.setFont(uiText.font)
    love.graphics.print(uiText.msg, uiText.x, uiText.y)
end

return Render
