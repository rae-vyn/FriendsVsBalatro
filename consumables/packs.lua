SMODS.Booster({
    key = "basic_pack",
    loc_txt = {
        name = "Basic Pack",
        group_name = "Basic Pack",
        text = {
            "Contains 5",
            "Friends Vs. Friends cards",
        }
    },
    config = {
        extra = 5,
        choose = 5
    },
    kind = "Weapon",
    create_card = function(self, card, i)
        return {
            set = "Weapon"
        }
    end
})