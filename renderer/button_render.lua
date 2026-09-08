local Render = {}

function Render:draw(uiButton)
    local x = uiButton.x
    local y = uiButton.y
    local w = uiButton.w
    local h = uiButton.h
    local color = uiButton.color
    -- body
    love.graphics.setColor(color.r, color.g, color.b)
    love.graphics.rectangle("fill", x, y, w, h)
    -- border
    love.graphics.setColor(uiButton.borderColor.r, uiButton.borderColor.g, uiButton.borderColor.b)
    love.graphics.rectangle("line", x, y, w, h)
    -- name
    x = x + 2
    y = y + 2
    love.graphics.setColor(uiButton.textColor.r, uiButton.textColor.g, uiButton.textColor.b)
    love.graphics.setFont(uiButton.font)
    love.graphics.print(uiButton.name, x, y)

    love.graphics.setColor(1, 1, 1, 1)
end

return Render
