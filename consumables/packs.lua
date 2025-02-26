SMODS.Atlas({
    key = "basicpack",
    px = 71,
    py = 95,
    path = "basicpack.png"
})

SMODS.ObjectType({
    key = "fvb_cards",
    default = "c_fvb_boira",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
        G.P_CENTER_POOLS.FVB = {}
        for i, v in ipairs(FVB.cards) do
            self.cards[v] = true
        end
    end,
    inject_card = function(self, center)
        SMODS.ConsumableType.inject_card(self, center)
        SMODS.insert_pool(G.P_CENTER_POOLS.FVB, center)
    end,

})

SMODS.Booster({
    key = "basic_pack",
    atlas = "basicpack",
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
    weight = 3,
    kind = "Weapon",
    select_card = {Buff = "consumeables", Weapon = "weapons"},
    create_card = function(self, card, i)
        if not G.is_fvb then
            return {
                set = "Spectral",
                skip_materialize = true
            }
        end
        return {
            set = "fvb_cards",
            skip_materialize = true,
        }
    end,
})
