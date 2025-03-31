SMODS.Joker({
    key = "cash_card",
    atlas = "card_backs",
    pos = {x = 0, y = 5},
    config = {
        extra = {
            money_amount = 2
        }
    },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.extra.money_amount, #G.consumeables.cards * card.ability.extra.money_amount}}
    end,
    calc_dollar_bonus = function (self, card)
        return #G.consumeables.cards * card.ability.extra.money_amount
    end
})