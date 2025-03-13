SMODS.ConsumableType({
    key = 'HotCard',
    primary_colour = HEX("697b7f"),
    secondary_colour = HEX("697b7f"),
    default = 'c_fvb_green_herb',
})
SMODS.Consumable({
    key = "green_herb",
    set = "HotCard",
    atlas = "othercards",
    pos = {x = 4, y = 5},
    unlocked = true,
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
    key = "banding",
    set = "HotCard",
    atlas = "othercards",
    pos = {x = 3, y = 9},
    unlocked = true,

    calculate = function(self, card, context)
        if context.end_of_round then card:start_dissolve() end
    end,
    use = function(self, card, area, copier)
        for _, _card in ipairs(G.hand.cards) do
            if pseudorandom('banding') < 0.5 then
                eventify(function()
                    eventify(function() _card:flip() delay(0.5) end)
                    eventify(function() _card:set_ability(G.P_CENTERS.m_mult) end)
                    eventify(function() _card:juice_up() end)
                    eventify(function() delay(0.5) _card:flip() end)
                end)
            end
        end
    end,
    can_use = function (self, card)
        return G.STAGE == G.STAGES.RUN
    end
})
