SMODS.Back({
    key = "friends_deck",
    atlas = "card_backs",
    pos = {x = 7, y = 8},
    unlocked = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                local card = SMODS.add_card({
                    set = "Joker",
                    rarity = "fvb_personality",
                    stickers = {"eternal"}
                })
                check_for_unlock({fvb_char = card.config.center_key})
                return true
            end
        }))
    end
})

SMODS.Back({
    key = "baba_deck",
    atlas = "card_backs",
    pos = {x = 0, y = 0},
    unlocked = true,
    config = {
        no_interest = true,
        extra_hand_bonus = 0,
    },
    calculate = function(self, back, context)
        if context.weapon_hit then
            return {
                func = function()
                    eventify(function()
                        G.deck.cards[1]:juice_up()
                        context.other_card:set_ability(G.P_CENTERS.m_gold)
                    end)
                end
            }
        end
    end
})

SMODS.Back({
    key = "siaro_deck",
    atlas = "card_backs",
    pos = {x = 6, y = 4},
    unlocked = true,
    calculate = function(self, card, context)
        if context.weapon_hit then
            eventify(function()
                context.other_card:set_edition({fvb_poison_ed = true}, true)
            end)
        end
    end
})

SMODS.Back({
    key = "schema_deck",
    config = {extra = {ante_counter = 3, last_ante = 1}},
    atlas = "card_backs",
    pos = {x = 7, y = 7},
    unlocked = true,
    apply = function(self, back) end,
    calculate = function(self, back, context)
        if context.end_of_round and not context.individual and
            not context.repetition and context.cardarea == G.hand and
            G.GAME.blind:get_type() == "Boss" then
            self.config.extra.ante_counter = self.config.extra.ante_counter - 1
            if self.config.extra.ante_counter == 0 then -- give blueprint
                self.config.extra.ante_counter = 3
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = SMODS.add_card({
                            set = "Joker",
                            key = "j_blueprint"
                        })
                        play_sound("tarot1", 1, 0.5)
                        G.deck.cards[1]:juice_up()
                        return true
                    end
                }))
            end
        end
    end
})

SMODS.Back({
    key = "champs_deck",
    atlas = "card_backs",
    pos = {x = 6, y = 6},
    unlocked = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    card:set_ability(G.P_CENTERS.m_lucky, true, true)
                end
                return true
            end
        }))
    end
})

SMODS.Back({
    key = "abyssal_deck",
    config = {extra = {ante_counter = 2}},
    atlas = "card_backs",
    pos = {x = 0, y = 2},
    calculate = function(self, card, context)
        if context.modify_shop_joker then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if context.card.ability.set == "Joker" then
                        eventify(function()
                            context.card:set_edition({negative = true}, true)
                            G.deck.cards[1]:juice_up()
                        end)
                    end
                    return true
                end
            }))
        end
        if context.end_of_round and not context.individual and
            not context.repetition and context.cardarea == G.hand and
            G.GAME.blind:get_type() == "Boss" then -- exactly once, on boss blind end of round
            if card.effect.config.extra.ante_counter ~= 0 then
                card.effect.config.extra.ante_counter =
                    card.effect.config.extra.ante_counter - 1
            else
                card.effect.config.extra.ante_counter = 2
                G.hand:change_size(-1)
                return {
                    message = "-1 Hand Size",
                    message_card = G.deck.cards[1]
                }
            end
        end
    end
})

SMODS.Back({
    key = "fossil_deck",
    atlas = "card_backs",
    pos = {x = 1, y = 8},
    config = {extra = {odds = 4}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {(G.GAME.probabilities.normal or 1), self.config.extra.odds}
        }
    end,
    calculate = function(self, card, context)
        if context.weapon_hit and
            SMODS.has_enhancement(context.other_card, 'm_stone') then
            if pseudorandom('fossil') < G.GAME.probabilities.normal /
                self.config.extra.odds then
                context.other_card.ability.was_hit = true
            end
            eventify(function()
                context.other_card:set_ability(G.P_CENTERS.c_base)
            end)
        end
        if context.destroy_card and context.cardarea == G.play then
            if context.destroying_card.ability.was_hit then
                if #G.deck.cards > 0 then
                    G.deck.cards[1]:juice_up()
                end
                return {remove = true}
            end
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    card:set_ability(G.P_CENTERS.m_stone, true, true)
                end
                return true
            end
        }))
    end
})

SMODS.Back({
    key = "fortune_deck",
    atlas = "fortune_deck",
    config = {extra = {mult = 1.5, odds = 8}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (G.GAME.probabilities.normal or 1), self.config.extra.odds,
                self.config.extra.mult
            }
        }
    end,
    calculate = function(self, back, context)
        if context.other_consumeable then
            if context.other_consumeable.config.center_key ==
                "c_wheel_of_fortune" then
                SMODS.calculate_effect({xmult = self.config.extra.mult},
                                       context.other_consumeable)
                return
            end
        end
        if context.end_of_round and context.game_over == false and
            pseudorandom('fortune') < G.GAME.probabilities.normal /
            self.config.extra.odds then
            SMODS.add_card({key = "c_wheel_of_fortune", edition = "e_negative"})
        end
    end
})

SMODS.Back({
    key = "mystical_deck",
    atlas = "card_backs",
    pos = {x = 1, y = 3},
    config = {
        extra = {odds = 4},
        vouchers = {"v_planet_merchant", "v_planet_tycoon"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {(G.GAME.probabilities.normal or 1), self.config.extra.odds}
        }
    end,
    calculate = function(self, back, context)
        if context.weapon_hit and pseudorandom('mystical') <
            G.GAME.probabilities.normal / self.config.extra.odds then
            return {
                message = localize("k_fvb_hit"),
                func = function()
                    eventify(function()
                        if #G.consumeables.cards < G.consumeables.config.card_limit then
                            local tarot = pseudorandom_element({
                                "c_moon", "c_sun", "c_world", "c_lovers", "c_star"
                            }, pseudoseed("mystic"))
                            SMODS.add_card({key = tarot})
                        end
                    end)
                end
            }
        end
    end
})
