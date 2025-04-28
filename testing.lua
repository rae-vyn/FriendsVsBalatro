return {
    key = "j_fvb_friends_movie",
    calculate = function (self, card, context)
        if context.retrigger_joker_check and context.other_context.cardarea == G.weapons then
            print("we made it")
            return {
                repetitions = 1
            }
        end
    end
}
