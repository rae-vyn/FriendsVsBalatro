return {
    key = "j_fvb_jawhara",
    calculate = function(self, card, context)
        if context.weapon_missed and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + 0.5
        end
        if context.joker_main then
            return {xmult = card.ability.extra.mult}
        end
    end
}
