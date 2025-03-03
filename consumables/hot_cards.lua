SMODS.ConsumableType({
    key = 'HotCard',
    primary_colour = HEX("697b7f"),
    secondary_colour = HEX("697b7f"),
    default = 'c_fvb_green_herb',
    loc_txt = {
        name = "Hot Card",
        collection = "Hot Cards",
        undiscovered = {
            name = "Undiscovered Hot Card",
            text = {"Generate this hot card", "to unlock"}
        }
    }
})
SMODS.Consumable({
    key = "green_herb",
    set = "HotCard",
    atlas = "othercards",
    pos = {x = 4, y = 5},
    unlocked = true,
    loc_txt = {
        name = "Green Herb",
        text = {"Gives {C:blue}+20{} Chips", "to each card in hand"}
    },
    calculate = function(self, card, context)
        if context.end_of_round then card:start_dissolve() end
    end,
    use = function(self, card, area, copier)
        for _, _card in ipairs(G.hand.cards) do
            _card.ability.perma_bonus = (_card.ability.perma_bonus or 0) + 20
            _card:juice_up()
        end
    end,
    can_use = function (self, card)
        return G.STAGE == G.STAGES.RUN
    end
})
SMODS.Consumable({
    key = "dither",
    set = "HotCard",
    atlas = "othercards",
    pos = {x = 2, y = 9},
    unlocked = true,
    loc_txt = {
        name = "Dither",
        text = {"Gives {C:blue}+100{} Chips", "to each card in hand"}
    },
    calculate = function(self, card, context)
        if context.end_of_round then card:start_dissolve() end
    end,
    use = function(self, card, area, copier)
        for _, _card in ipairs(G.hand.cards) do
            _card.ability.perma_bonus = (_card.ability.perma_bonus or 0) + 100
            _card:juice_up()
        end
    end,
    can_use = function (self, card)
        return G.STAGE == G.STAGES.RUN
    end
})
SMODS.Consumable({
    key = "banding",
    set = "HotCard",
    atlas = "othercards",
    pos = {x = 3, y = 9},
    unlocked = true,
    loc_txt = {
        name = "Banding",
        text = {"Turns each card in hand", "into a {C:mult}Mult{} Card"}
    },
    calculate = function(self, card, context)
        if context.end_of_round then card:start_dissolve() end
    end,
    use = function(self, card, area, copier)
        for _, _card in ipairs(G.hand.cards) do
            _card:set_ability(G.P_CENTERS.m_mult)
            _card:juice_up()
        end
    end,
    can_use = function (self, card)
        return G.STAGE == G.STAGES.RUN
    end
})
