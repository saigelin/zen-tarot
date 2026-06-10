local Card = require("ui.card")
local Deck = {
    cards = {},
    drawResult = nil
}

function Deck:load(cardData)
    self.cards = {}
    for _, cd in ipairs(cardData) do
        local co = Card(cd.id, cd.name, cd.message, cd.imagePath)
        table.insert(self.cards, co)
    end
end

function Deck:drawCard()
    local n = math.random(1, #self.cards)
    self.drawResult = n
    print("Deck draw out card", self.cards[n].name)
    return self.cards[self.drawResult]
end

return Deck
