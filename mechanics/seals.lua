
SMODS.Seal({
    key = "poison",
    atlas = "poisoned",
    badge_colour = HEX('4F6552'),
    config = {
        extra = {
            odds = 2,
            other_odds = 10,
        }
    },
    loc_vars = function(self, info_queue, card) 
        return { vars = {(G.GAME.probabilities.normal or 1), card.ability.seal.extra.odds, card.ability.seal.extra.other_odds}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local pseudoval = pseudorandom('poison')
            if pseudoval < G.GAME.probabilities.normal / card.ability.seal.extra.odds then
                return {xmult = 2}
            elseif pseudoval < G.GAME.probabilities.normal / card.ability.seal.extra.other_odds then
                return {xmult = 0.5}
            end
        end
    end
})
