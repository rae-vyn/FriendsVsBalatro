return {
<<<<<<< HEAD
    key = "j_fvb_jawhara",
    calculate = function(self, card, context)
        if context.weapon_missed and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + 0.5
        end
        if context.joker_main then
            return {xmult = card.ability.extra.mult}
=======
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
>>>>>>> 578fc0907f4e14176b9ed758f3419fe5e9103337
        end
    end
}
