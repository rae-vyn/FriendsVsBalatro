return {
    key = "b_fvb_abyssal_deck",
    loc_txt = {
        name = "Abyssal Deck",
        text = {
            "Every {C:attention}Joker",
            "in the shop is {C:purple,E:1,T:e_negative}Negative{}",
            "{C:red}-1{} hand size every other Ante"
        }
    },
    calculate = function(self, card, context)
        if context.modify_shop_joker then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if context.card.ability.set == "Joker" then
                        context.card:set_edition({negative = true}, true)
                    end
                    G.deck.cards[1]:juice_up()
                    return true
                end
            }))
        end
        if context.end_of_round and not context.individual and
            not context.repetition and context.cardarea == G.hand 
			and G.GAME.blind:get_type() == "Boss" then
			print("boss blind")
            if card.effect.config.extra.ante_counter ~= 0 then
                card.effect.config.extra.ante_counter =
                    card.effect.config.extra.ante_counter - 1
            else
                card.effect.config.extra.ante_counter = 2
                G.hand:change_size(-1)
                return {message = "-1 Hand Size"}
            end
        end
    end
}
