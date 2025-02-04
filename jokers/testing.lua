return {
    key = "c_fvb_boira",
    atlas = "placeholder",
    calculate = function(self, card, context)
        if context.blueprint then return end
        if context.joker_main then
            print("this ran!")
            return {
                chips = 200
            }
        end
    end,
}