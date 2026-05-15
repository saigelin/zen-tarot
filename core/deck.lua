local Card = require("core.card")
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
end

function Deck:getCard()
    if not self.drawResult then
        return nil
    end
    return self.cards[self.drawResult]
end

return Deck
