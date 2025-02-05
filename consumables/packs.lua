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
        choose = 2
    },
    kind = "Weapon",
    create_card = function(self, card, i)
        return {
            set = "Weapon",
            area = G.weapons
        }
    end
})