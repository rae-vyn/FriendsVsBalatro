return {
    key = "j_fvb_haru",
    calculate = function(self, card, context)
        if context.skip_blind then
            card.ability.extra.xmult_gain = 1
            return {message = "Reset!"}
        end
        if context.setting_blind and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
			return {message = "Upgraded!"}
        end
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.xmult_gain = card.ability.extra.xmult_gain + 1
            return {message = "Accelerating!"}
        end
    end
}
