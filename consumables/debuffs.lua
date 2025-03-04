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
                    return info.reward(card)
                end
            end
        end,
        use = info.use,
        can_use = info.can_use,
        unlocked = true,
        on_select = function(self, card)
            card.T.w = card.T.w * 0.5
            card.T.h = card.T.h * 0.5
        end
    })
    table.insert(FVB.cards, "c_fvb_" .. info.key)
end

Debuff({
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
            eventify(function() card:start_dissolve() end)
        end)
    end,
    can_use = function(self, card) return false end
})

Debuff({
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
            eventify(function() card:start_dissolve() end)
        end)
    end,
    can_use = function(self, card) return false end
})

Debuff({
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
        eventify(function() SMODS.create_card({set = "Buff"}) end)
        eventify(function() card:start_dissolve() end)
    end
})

Debuff({
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
        if SMODS.find_mod("Talisman") then
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
        eventify(function() card:start_dissolve() end)
    end
})

Debuff({
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
        eventify(function() card:start_dissolve() end)
    end
})

Debuff({
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
        eventify(function() card:start_dissolve() end)
    end
})
