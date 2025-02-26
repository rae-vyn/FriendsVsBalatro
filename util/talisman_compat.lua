SMODS.Joker:take_ownership('fvb_bach', {
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if G.GAME.chips / G.GAME.blind.chips >= to_big(0.75) then
                G.GAME.chips = G.GAME.blind.chips
                return {message = "Won!"}
            end
        end
    end
})

SMODS.Consumable:take_ownership('fvb_small_head', {
    can_use = function(self, card) return G.GAME.blind.chips > to_big(0) end
})
SMODS.Consumable:take_ownership('fvb_move_faster', {
    can_use = function(self, card) return G.GAME.blind.chips > to_big(0) end
})
