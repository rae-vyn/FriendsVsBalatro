SMODS.Joker({
    key = "cash_card",
    atlas = "card_backs",
    pos = {x = 0, y = 5},
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    add_to_deck = function (self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true end }))
    end,
    remove_from_deck = function (self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true end }))
    end,
})