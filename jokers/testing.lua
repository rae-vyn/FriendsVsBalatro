return {
    key = "c_fvb_boira",
    atlas = "placeholder",
    loc_txt = {name = "Boira", text = {"Everyone's favorite weapon!", "{C:white,X:mult}+150{} Mult"} },
    calculate = function(self, card, context)
        if context.blueprint then return end
        if context.joker_main then
            return {
                mult = 200
            }
        end
    end,
}