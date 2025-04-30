SMODS.Blind({
    key = "the_jam",
    atlas = "the_jam",
    boss = { min = 2 },
    boss_colour = HEX("E0569B"),
    discovered = true,
    set_blind = function (self)
        for _, card in ipairs(G.weapons.cards) do
            SMODS.debuff_card(card, true, "the_jam")
            card:juice_up()
        end
    end,
    disable = function (self)
        for _, card in ipairs(G.weapons.cards) do
            SMODS.debuff_card(card, false, "the_jam")
            card:juice_up()
        end
    end,
    defeat = function (self)
        for _, card in ipairs(G.weapons.cards) do
            SMODS.debuff_card(card, false, "the_jam")
            card:juice_up()
        end
    end,
})
SMODS.Blind({
    key = "the_laundry",
    atlas = "the_laundry",
    boss = { min = 2 },
    boss_colour = HEX("0B2F57"),
    discovered = true,
    calculate = function (self, blind, context)
        if context.weapon_hit then
            return {
                func = function()
                    ease_dollars(-1)
                end
            }
        end
    end,
})