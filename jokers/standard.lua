SMODS.Joker({
    key = "cash_card",
    atlas = "card_backs",
    pos = {x = 0, y = 5},
    config = {
        extra = {
            money_gain = 2,
            money_amount = 0
        }
    },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.extra.money_gain, card.ability.extra.money_amount}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.game_over and #G.consumeables.cards == G.consumeables.config.card_limit then
            card.ability.extra.money_amount = card.ability.extra.money_amount + card.ability.extra.money_gain
        end
    end,
    calc_dollar_bonus = function (self, card)
        return #G.consumeables.cards * card.ability.extra.money_amount
    end
})