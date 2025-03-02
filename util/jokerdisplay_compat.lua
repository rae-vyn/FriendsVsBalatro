local jd = JokerDisplay.Definitions

jd["j_fvb_dooper"] = {
    text = {
        {
            {text = "Currently"},
            border_nodes = {
                { ref_table = "card.joker_display_values", ref_value = "multype" },
                { ref_table = "card.ability.extra", ref_value = "mult"}
            }
        }
    },
    calc_function = function(card)
        if G.GAME and G.GAME.current_round.hands_left <= 1 then
            card.joker_display_values.multype = "X"
        else
            card.joker_display_values.multype = "+"
        end
    end
}
