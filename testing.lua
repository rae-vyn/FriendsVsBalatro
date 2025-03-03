return {
    key = "c_fvb_big_head",
    calculate = function(self, card, context)
        if context.setting_blind then info.effect(card) end
        if context.end_of_round and not context.individual and
            not context.repetition and context.cardarea == G.consumeables then
            card.ability.extra.timer = card.ability.extra.timer - 1
            if card.ability.extra.timer == 0 then
                info.reward(card)
            end
        end
    end
}
