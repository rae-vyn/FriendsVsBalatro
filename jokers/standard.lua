SMODS.Joker({
    key = "cash_card",
    atlas = "card_backs",
    pos = {x = 0, y = 5},
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end
})

SMODS.Joker({
    key = "friends_movie",
    atlas = "card_backs",
    pos = {x = 6, y = 7},
    config = {extra = {repetitions = 1}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.repetitions}}
    end,
    rarity = 3,
    cost = 8,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.retrigger_joker_check and context.other_context.cardarea ==
            G.weapons then
            print("we made it")
            return {repetitions = 1}
        end
    end
})

SMODS.Joker({
    key = "ressurector",
    atlas = "card_backs",
    pos = {x = 3, y = 0},
    config = {extra = {destroyed = false}},
    calculate = function(self, card, context)
        if context.destroy_card and not card.ability.extra.destroyed then
            allcards = {}
            count = 1
            for _, area in ipairs({G.hand, G.jokers, G.consumeables}) do
                for _, cd in ipairs(area) do
                    allcards[count] = cd
                    count = count + 1
                end
            end
                
            chosen = pseudorandom_element(allcards, pseudoseed("embrace"))
            card.ability.extra.destroyed = true
            return {
                remove = true,
                func = function() chosen:start_dissolve() ease_dollars(25) end
            }
        end
        if context.hand_drawn then card.ability.extra.destroyed = false end
    end,
    draw = function(self, card, layer)
        card.children.center:draw_shader("voucher", nil,
                                        card.ARGS.send_to_shader)
    end
})
