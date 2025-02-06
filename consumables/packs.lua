--[[
SMODS.ObjectType({
    key = "FVB",
    default = "j_fvb_steel_bullets",
    cards = {
        ["j_fvb_steel_bullets"] = true,--[[
        ["j_fvb_small_head"] = true,
        ["j_fvb_health_up"] = true,
        ["j_fvb_big_mag"] = true,
    },
    inject = function(self)
        for _, v in ipairs(FVB.cards) do
            self.cards[v] = true
        end
    end
})
]]
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
            skip_materialize = true,
        }
    end
})