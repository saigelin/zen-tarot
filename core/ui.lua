local uiState = {
    IDLE = 0,
    ButtonClick = 1
}
local UI = {
    welcomeMsg = {
        msg = "Welcome to Meditation World",
        x = 10,
        y = 10
    },
    usageMsg = {
        msg = "Please Press 'space' or Click to Meditate by Card",
        x = 10,
        y = 60
    },
    buttonLayout = {
        x = 10,
        y = 110,
        w = 100,
        h = 50
    },
    cardLayout = {
        x = 10,
        y = 10
    },
    state = uiState.IDLE
}

function UI:getWelcome()
    return self.welcomeMsg
end

function UI:getUsage()
    return self.usageMsg
end

function UI:getButton()
    return self.buttonLayout
end

function UI:getCard()
    return self.cardLayout
end

function UI:isButtonPressed(x, y)
    local layout = self.buttonLayout
    if x >= layout.x and x <= (layout.x + layout.w) and y >= layout.y and y <= (layout.y + layout.h) then
        return true
    end
    return false
end

return UI
