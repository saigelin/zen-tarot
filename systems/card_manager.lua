local Card = require("ui.card")
local Manager = {
    cards = {}
}

function Manager:load(cardData)
    self.cards = {}
    for _, cd in ipairs(cardData) do
        local co = Card(cd)
        table.insert(self.cards, co)
    end
end

function Manager:drawCard()
    local n = math.random(1, #self.cards)
    print("draw out card", self.cards[n].name)
    return self.cards[n]
end

function Manager:findCardById(id)
    for _, cd in ipairs(self.cards) do
        if id == cd.id then
            return cd
        end
    end
    return nil
end

return Manager
