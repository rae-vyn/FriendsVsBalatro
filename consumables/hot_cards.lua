SMODS.ConsumableType({
    key = 'HotCard',
    primary_colour = HEX("D92156"),
    secondary_colour = HEX("D92156"),
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
    atlas = 'placeholder',
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
