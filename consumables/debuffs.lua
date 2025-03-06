SMODS.ConsumableType({
    key = "Debuff",
    primary_colour = HEX("CE2256"),
    secondary_colour = HEX("CE2256"),
    default = "c_fvb_big_head",
    loc_txt = {
        name = "Debuff",
        collection = "Debuffs",
        undiscovered = {
            name = "Undiscovered Debuff",
            text = {"Find this debuff", "in a pack to unlock"}
        }
    }
})
function Debuff(info)
    SMODS.Consumable({
        key = info.key,
        set = "Debuff",
        atlas = info.atlas or "placeholder",
        pos = info.pos or nil,
        config = {extra = {timer = info.rounds or 3, more = info.more}},
        loc_txt = {name = info.name, text = info.text or {"A debuff."}},
        loc_vars = info.loc_vars or function(self, info_queue, card)
            return {vars = {card.ability.extra.timer}}
        end,
        calculate = function(self, card, context)
            if context.setting_blind then
                sendDebugMessage("round started", "Debuffs")
                if not info.passive then info.effect(card) end
            end
            if info.passive then info.effect(card, context) end
            if context.end_of_round and not context.individual and
                not context.repetition then
                sendDebugMessage("round ended", "Debuffs")
                card.ability.extra.timer = card.ability.extra.timer - 1
                if card.ability.extra.timer == 0 then
                    eventify(function() info.reward(card) end)
                    eventify(function() card:start_dissolve() end)
                end
            end
        end,
        use = info.use,
        can_use = info.can_use,
        unlocked = true,
        on_select = function(self, card)
            card.T.w = card.T.w * 0.5
            card.T.h = card.T.h * 0.5
        end,
        add_to_deck = info.add_to_deck
    })
    table.insert(FVB.cards, "c_fvb_" .. info.key)
end

Debuff({ -- Big Head
    key = "big_head",
    name = "Big Head",
    atlas = "othercards",
    pos = {x = 0, y = 0},
    rounds = 3,
    text = {
        "{C:attention}X1.25{} Blind size",
        "After {C:mult}#1#{} rounds gain {C:money}$20{}",
        "{C:inactive}(Self destructs after)"
    },
    effect = function(card)
        G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 1.25)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

        local chips_UI = G.hand_text_area.blind_chips
        G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
        G.HUD_blind:recalculate()
        chips_UI:juice_up()

        play_sound("chips2")
        card:juice_up()
    end,
    reward = function(card)
        eventify(function()
            ease_dollars(20)
        end)
    end,
    can_use = function(self, card) return false end
})

Debuff({ -- Health Down
    key = "heath_down",
    name = "Health Down",
    atlas = "othercards",
    pos = {x = 2, y = 0},
    rounds = 5,
    passive = true,
    text = {
        "Removes {C:chips}-1{} Chips per card played",
        "After {C:mult}#1#{} rounds gain {C:chips}+1{} hand",
        "{C:inactive}(Self destructs after)"
    },
    effect = function(card, context)
        if context.individual and context.cardarea == G.play then
            local other_card = context.other_card
            eventify(function()
                other_card.ability.perma_bonus =
                    (other_card.ability.perma_bonus or 0) - 1 * #G.play.cards
            end)
            eventify(function()
                other_card:juice_up()
                card:juice_up()
            end)
        end
    end,
    reward = function(card)
        eventify(function()
            eventify(function()
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
            end)
            eventify(function() ease_hands_played(1) end)
        end)
    end,
    can_use = function(self, card) return false end
})

Debuff({ -- Move Slower
    key = "move_slower",
    name = "Move Slower",
    text = {
        "{C:attention}+200{} to blind size",
        "After {C:mult}#1#{} rounds gain a {C:buff}Buff{} card",
        "{C:inactive}(Self destructs after)"
    },
    atlas = "othercards",
    pos = {x = 4, y = 0},
    rounds = 5,
    effect = function(card)
        eventify(function()
            G.GAME.blind.chips = G.GAME.blind.chips + 200
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

            local chips_UI = G.hand_text_area.blind_chips
            G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
            G.HUD_blind:recalculate()
            chips_UI:juice_up()

            play_sound("chips2")
            card:juice_up()
        end)
    end,
    reward = function(card)
        eventify(function() SMODS.add_card({set = "Buff"}) end)
    end
})

Debuff({ -- No Jump
    key = "no_jump",
    name = "No Jump",
    text = {
        "Beat blinds in {C:mult}one hand{} or lose",
        "After {C:mult}#1#{} rounds gain {C:mult}+3{} hand size",
        "{C:inactive}(Self destructs after)"
    },
    atlas = "othercards",
    pos = {x = 7, y = 0},
    rounds = 3,
    passive = true,
    more = {used_discards = 0},
    effect = function(card, context)
        if context.setting_blind then
            card.ability.extra.more.used_discards =
                G.GAME.current_round.discards_used
        end
        if next(SMODS.find_mod("Talisman")) then
            if context.hand_drawn and not context.first_hand_drawn and
                to_big(G.GAME.blind.chips) > to_big(G.GAME.chips) then
                if card.ability.extra.more.used_discards <
                    G.GAME.current_round.discards_used then
                    card.ability.extra.more.used_discards =
                        G.GAME.current_round.discards_used
                    return
                end
                print('hi! talisman')
                end_round()
                return
            end
        end
        if context.hand_drawn and not context.first_hand_drawn and
            G.GAME.blind.chips > G.GAME.chips then
            if card.ability.extra.more.used_discards <
                G.GAME.current_round.discards_used then
                card.ability.extra.more.used_discards =
                    G.GAME.current_round.discards_used
                return
            end
            print('hi! base')
            end_round()
        end
    end,
    reward = function(card)
        eventify(function() G.hand:change_size(3) end)
        eventify(function() card:juice_up() end)
    end
})

Debuff({ -- Less Accuracy
    key = "less_accuracy",
    name = "Less Accuracy",
    text = {
        "{C:mult}+10%{} miss chance every round",
        "After {C:mult}#1#{} rounds set miss chance to {C:green}25%{}",
        "{C:inactive}(Self destructs after)"
    },
    atlas = "othercards",
    pos = {x = 10, y = 0},
    rounds = 3,
    effect = function(card)
        eventify(function()
            for _, weapon in ipairs(G.weapons.cards) do
                weapon.ability.extra.miss_chance =
                    weapon.ability.extra.miss_chance + 10
                weapon:juice_up()
            end
        end)
    end,
    reward = function(card)
        eventify(function()
            for _, weapon in ipairs(G.weapons.cards) do
                weapon.ability.extra.miss_chance = 25
                weapon:juice_up()
            end
        end)
    end
})

Debuff({ -- Rubber Bullets
    key = "rubber_bullets",
    name = "Rubber Bullets",
    text = {
        "{C:mult}-5{} damage every round",
        "After {C:mult}#1#{} rounds set damage to {C:mult}30-50{}",
        "{C:inactive}(Self destructs after)"
    },
    atlas = "othercards",
    pos = {x = 1, y = 1},
    rounds = 3,
    effect = function(card)
        eventify(function()
            for _, weapon in ipairs(G.weapons.cards) do
                weapon.ability.extra.min_damage =
                    weapon.ability.extra.min_damage - 5
                weapon.ability.extra.max_damage =
                    weapon.ability.extra.max_damage - 5
                weapon:juice_up()
            end
        end)
    end,
    reward = function(card)
        eventify(function()
            for _, weapon in ipairs(G.weapons.cards) do
                weapon.ability.extra.min_damage = 30
                weapon.ability.extra.max_damage = 50
                weapon:juice_up()
            end
        end)
    end
})

Debuff({ -- Small Mag
    key = "small_mag",
    name = "Small Mag",
    atlas = "othercards",
    pos = {x = 3, y = 1},
    rounds = 6,
    text = {
        "{C:mult}75%{} max ammo amount",
        "After {C:mult}#1#{} rounds set ammo max to {C:red}30{}",
        "{C:inactive}(Self destructs after)"
    },
    effect = function(card)
        for _, weapon in ipairs(G.weapons.cards) do
            weapon.ability.extra.max_ammo = math.floor(weapon.ability.extra.max_ammo * 0.75)
        end
    end,
    reward = function(card)
        for _, weapon in ipairs(G.weapons.cards) do
            weapon.ability.extra.max_ammo = 30
        end
    end
})

Debuff({ -- Slow Reload
    key = "slow_reload",
    name = "Slow Reload",
    atlas = "othercards",
    pos = {x = 5, y = 1},
    rounds = 6,
    text = {
        "{C:mult}+1{} reload time",
        "After {C:mult}#1#{} rounds set reload time to {C:blue}2{}",
        "{C:inactive}(Self destructs after)"
    },
    effect = function(card)
        for _, weapon in ipairs(G.weapons.cards) do
            weapon.ability.extra.max_reload = weapon.ability.extra.max_reload + 1
        end
    end,
    reward = function(card)
        for _, weapon in ipairs(G.weapons.cards) do
            weapon.ability.extra.max_reload = 2
        end
    end
})

Debuff({ -- Invisible Hand
    key = "invisible_hand",
    name = "Invisible Hand",
    atlas = "othercards",
    pos = {x = 1, y = 2},
    rounds = 3,
    passive = true,
    text = {
        "{C:mult}Flips over all cards in hand",
        "After {C:mult}#1#{} rounds give {C:money}$30{}",
        "{C:inactive}(Self destructs after)"
    },
    effect = function(card, context)
        if context.hand_drawn then
            for _, card in ipairs(G.hand.cards) do
                if card.facing ~= "back" then
                    card:flip()
                end
            end
        end
    end,
    reward = function(card)
        eventify(function()
            ease_dollars(30)
        end)
    end
})

Debuff({
    key = "disarm",
    name = "Disarm",
    atlas = "othercards",
    pos = {x = 0, y = 3},
    rounds = 0,
    passive = true,
    text = {
        "Replaces weapon(s) with a {C:weapon}Boira",
        "Creates a {C:spectral}Spectral{} card",
        "{C:inactive}(Self destructs after)"
    },
    add_to_deck = function(self, card, from_debuff) 
        eventify(function ()
            SMODS.add_card({key = "c_fvb_boira"})
        end)
        eventify(function ()
            SMODS.add_card({set = "Spectral"})
        end)
        eventify(function ()
            card:start_dissolve()
        end)
    end
})