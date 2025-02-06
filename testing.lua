return {
    key = "p_fvb_basic_pack",
    create_card = function(self, card, i)
        return {
            set = "FVB",
            skip_materialize = true,
        }
    end
}