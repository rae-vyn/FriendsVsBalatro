SMODS.Joker({
    key = "cash_card",
    atlas = "card_backs",
    pos = {x = 0, y = 5},
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end
})

SMODS.Joker({
    key = "friends_movie",
    atlas = "card_backs",
    pos = {x = 6, y = 7},
    config = {extra = {repetitions = 1}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.repetitions}}
    end,
    rarity = 3,
    cost = 8,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.retrigger_joker_check and context.other_context.cardarea ==
            G.weapons then
            print("we made it")
            return {repetitions = 1}
        end
    end
})
