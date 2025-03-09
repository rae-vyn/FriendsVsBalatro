SMODS.Atlas({
    key = "personalities",
    px = 71,
    py = 95,
    path = "personalities.png"
})

SMODS.Rarity({
    key = "personality",
    loc_txt = {name = "Personality"},
    badge_colour = HEX("E7680D")
})

SMODS.Joker({
    key = "donnie_b",
    atlas = "personalities",
    pos = {x = 3, y = 0},
    config = {extra = {chips = 0, chips_gain = 20}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.chips_gain}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = true,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            not context.blueprint then
            if context.other_card:get_id() == 12 then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
                return {message = "Upgraded!", message_card = card}
            end
        end
        if context.joker_main then
            return {chips = card.ability.extra.chips}
        end
    end
})

SMODS.Joker({
    key = "stevie_gull",
    atlas = "personalities",
    pos = {x = 2, y = 3},
    config = {extra = {damage_gain = 5}},
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_fvb_golden_boira
        return {vars = {card.ability.extra.damage_gain}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            -- Set GB reload
            for _, weapon in ipairs(G.weapons.cards) do
                if weapon.config.center_key == "c_fvb_golden_boira" then
                    weapon.ability.extra.reloading = false
                    weapon.ability.extra.curr_ammo =
                        weapon.ability.extra.max_ammo
                    weapon.ability.extra.reload_countdown =
                        weapon.ability.extra.max_reload
                    weapon.ability.extra.min_damage =
                        weapon.ability.extra.min_damage + 5
                    weapon.ability.extra.max_damage =
                        weapon.ability.extra.max_damage + 5
                end
            end
        end
    end
})

SMODS.Joker({
    key = "spike_remington",
    atlas = "personalities",
    pos = {x = 1, y = 3},
    config = {extra = {damage_gain = 20}},
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.extra.damage_gain}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            not context.blueprint then
            if context.other_card:get_id() == 14 then
                for _, weapon in ipairs(G.weapons.cards) do
                    weapon.ability.extra.min_damage =
                        weapon.ability.extra.min_damage + 20
                    weapon.ability.extra.max_damage =
                        weapon.ability.extra.max_damage + 20
                    weapon:juice_up()
                end
                return {message = "Buffed!"}
            end
        end
    end
})

SMODS.Joker({
    key = "sable_santana",
    atlas = "personalities",
    pos = {x = 5, y = 2},
    config = {extra = {damage_gain = 1.5}},
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_fvb_katana
        return {vars = {card.ability.extra.damage_gain}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            -- Set GB reload
            for _, weapon in ipairs(G.weapons.cards) do
                if weapon.config.center_key == "c_fvb_katana" then
                    weapon.ability.extra.reloading = false
                    weapon.ability.extra.curr_ammo =
                        weapon.ability.extra.max_ammo
                    weapon.ability.extra.reload_countdown =
                        weapon.ability.extra.max_reload
                end
                weapon.ability.extra.min_damage =
                    weapon.ability.extra.min_damage * 1.5
                weapon.ability.extra.max_damage =
                    weapon.ability.extra.max_damage * 1.5
            end
        end
    end
})

SMODS.Joker({
    key = "duck_anderson",
    atlas = "personalities",
    pos = {x = 0, y = 1},
    rarity = "fvb_personality",
    blueprint_compat = false,
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_fvb_green_herb
    end,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            SMODS.add_card({key = "c_fvb_green_herb"})
            card:juice_up()
        end
    end
})

SMODS.Joker({
    key = "dj_newton",
    atlas = "personalities",
    pos = {x = 5, y = 0},
    rarity = "fvb_personality",
    blueprint_compat = false,
    config = {extra = {miss_reduction = 5}},
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.extra.miss_reduction}}
    end,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            for _, weapon in ipairs(G.weapons.cards) do
                weapon.ability.extra.miss_chance =
                    weapon.ability.extra.miss_chance - card.ability.extra.miss_reduction
                if weapon.ability.extra.miss_chance <= 0 then
                    weapon.ability.extra.miss_chance = 0
                end
                weapon:juice_up()
            end
            return {message = "Buffed!"}
        end
    end
})

SMODS.Joker({
    key = "moose_salto",
    atlas = "personalities",
    config = {extra = {skip_count = 0, xmult = 2, pow = 1}},
    pos = {x = 3, y = 2},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.pow}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = true,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.skip_blind and card.ability.extra.skip_count == 1 then
            card.ability.extra.skip_count = 0
            card.ability.extra.pow = card.ability.extra.pow + 1
            card.ability.extra.xmult = 2 ^ card.ability.extra.pow
            return {message = "Buffed!", message_card = card}
        elseif context.skip_blind then
            card.ability.extra.skip_count = card.ability.extra.skip_count + 1
        end
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
    end
})

SMODS.Joker({
    key = "myk_raver",
    atlas = "personalities",
    pos = {x = 4, y = 2},
    rarity = "fvb_personality",
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_fvb_brasshopper
    end,
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            for _, weapon in ipairs(G.weapons.cards) do
                if weapon.config.center_key == "c_fvb_brasshopper" then
                    weapon.ability.extra.max_ammo =
                        weapon.ability.extra.max_ammo * 2
                end
            end
        end
    end
})

SMODS.Joker({
    key = "little_lars",
    atlas = "personalities",
    pos = {x = 1, y = 2},
    config = {extra = {blind_reduction = 0.75, decrease_amount = 0.05}},
    loc_vars = function(self, info_queue, card)
        local formatted = (1 - card.ability.extra.blind_reduction) * 100
        return {vars = {formatted, card.ability.extra.decrease_amount * 100}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.75)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

            local chips_UI = G.hand_text_area.blind_chips
            G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
            G.HUD_blind:recalculate()
            chips_UI:juice_up()

            play_sound("chips2")
        end
        if context.end_of_round and G.GAME.blind.boss and not context.blueprint and
            not context.repetition and not context.individual then
            card.ability.extra.blind_reduction =
                card.ability.extra.blind_reduction - card.ability.extra.decrease_amount
            return {message = "Buffed!"}
        end
    end
})

SMODS.Joker({
    key = "haru",
    atlas = "personalities",
    pos = {x = 1, y = 1},
    config = {extra = {xmult = 1, xmult_gain = 1}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult, card.ability.extra.xmult_gain}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = true,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.skip_blind then
            card.ability.extra.xmult_gain = 1
            return {message = "Reset!"}
        end
        if context.setting_blind and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
			return {message = "Upgraded!"}
        end
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.xmult_gain = card.ability.extra.xmult_gain + 1
            return {message = "Accelerating!"}
        end
    end
})

SMODS.Joker({
    key = "klustr",
    atlas = "personalities",
    pos = {x = 4, y = 1},
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if not (#G.consumeables.cards < G.consumeables.config.card_limit - 2) then
                return
            end
            SMODS.add_card({key = "c_fvb_dither"})
            SMODS.add_card({key = "c_fvb_banding"})
            card:juice_up()
        end
    end
})

SMODS.Joker({
    key = "ribberto",
    atlas = "personalities",
    pos = {x = 5, y = 1},
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.before and next(context.poker_hands["Straight Flush"]) and
            not context.blueprint then
            if not (#G.jokers.cards < G.jokers.config.card_limit) then
                return
            end
            card:juice_up()
            SMODS.add_card({set = "Joker", rarity = "fvb_personality"})
        end
    end
})

SMODS.Joker({
    key = "margarita",
    atlas = "personalities",
    pos = {x = 2, y = 2},
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.joker_main and not context.blueprint then
            if next(context.poker_hands["Flush"]) then
                local suit = context.scoring_hand[1].base.suit
                if suit == "Hearts" then return {xmult = 10} end
                if suit == "Diamonds" then return {dollars = 20} end
                if suit == "Clubs" then return {chips = 500} end
                if suit == "Spades" then
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.8)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                    local chips_UI = G.hand_text_area.blind_chips
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate()
                    chips_UI:juice_up()

                    play_sound('chips2')
                    return {message = "Reduced!"}
                end
            end
        end
    end
})

SMODS.Joker({
    key = "dale",
    atlas = "personalities",
    pos = {x = 1, y = 0},
    rarity = "fvb_personality",
    config = {extra = {mult = 1, mult_gain = 1}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.mult_gain}}
    end,
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and
            not context.repetition_only then
            local target = context.scoring_hand[#context.scoring_hand]
            if context.other_card == target then
                if context.other_card:get_id() == 14 then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                    return {
                        message = "Upgraded!",
                        message_card = card,
                        repetitions = 1,
                        card = context.other_card
                    }
                end
                return {
                    message = "Again!",
                    message_card = card,
                    repetitions = 1,
                    card = context.other_card
                }
            end
        end
        if context.joker_main then
            return {xmult = card.ability.extra.mult}
        end
    end
})

SMODS.Joker({
    key = "dingo",
    atlas = "personalities",
    pos = {x = 2, y = 0},
    config = {extra = {mult = 1, mult_gain = 0.8}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.mult_gain}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.discard then
            if not SMODS.has_no_rank(context.other_card) then
                card.ability.extra.mult =
                    card.ability.extra.mult + card.ability.extra.mult_gain
                context.other_card:start_dissolve()
            end
            return {remove = true}
        end
        if context.joker_main then
            return {xmult = card.ability.extra.mult}
        end
    end
})

SMODS.Joker({
    key = "siaro",
    atlas = "personalities",
    pos = {x = 0, y = 3},
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.other_card:set_seal('fvb_poison', true, true)
            context.other_card:juice_up()
        end
    end
})

SMODS.Joker({
    key = "jawhara",
    atlas = "personalities",
    pos = {x = 2, y = 1},
    config = {extra = {mult = 1, mult_gain = 0.5}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.mult_gain}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.weapon_missed and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
        end
        if context.joker_main then
            return {xmult = card.ability.extra.mult}
        end
    end
})

SMODS.Joker({
    key = "laika",
    atlas = "personalities",
    pos = {x = 0, y = 2},
    config = {extra = {mult = 1, mult_gain = 0.5}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.mult_gain}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.weapon_hit and not context.blueprint then
            for _, weapon in ipairs(G.weapons.cards) do
                if weapon.config.center_key == "c_fvb_laika" then
                    card.ability.extra.mult = card.ability.extra.mult + 1
                end
            end
        end
        if context.setting_blind and not context.blueprint then
            for _, weapon in ipairs(G.weapons.cards) do
                if weapon.config.center_key == "c_fvb_laika" then
                    if weapon.config.center_key == "c_fvb_laika" then
                        weapon.ability.extra.reloading = false
                        weapon.ability.extra.max_ammo = 2
                        weapon.ability.extra.curr_ammo =
                            weapon.ability.extra.max_ammo
                        weapon.ability.extra.reload_countdown = weapon.ability
                                                                    .extra
                                                                    .max_reload
                    end
                end
            end
        end
        if context.joker_main then
            return {xmult = card.ability.extra.mult}
        end
    end
})

SMODS.Joker({
    key = "dooper",
    atlas = "personalities",
    pos = {x = 4, y = 0},
    config = {extra = {mult = 0, mult_gain = 5}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.mult_gain}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            not context.blueprint then
            if context.other_card.base.suit == "Hearts" then
                card.ability.extra.mult = card.ability.extra.mult + 5
            end
        end
        if context.joker_main then
            if G.GAME.current_round.hands_left == 0 and card.ability.extra.mult > 0 then
                return {xmult = card.ability.extra.mult}
            else
                return {mult = card.ability.extra.mult}
            end
        end
    end
})

SMODS.Joker({
    key = "ktqtpi",
    atlas = "personalities",
    pos = {x = 3, y = 1},
    rarity = "fvb_personality",
    config = {extra = {chip_gain = 5}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chip_gain}}
    end,
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.individual and not context.blueprint then
            context.other_card.ability.perma_bonus =
                (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chip_gain
            context.other_card:juice_up()
        end
    end
})

SMODS.Joker({
    key = "bach",
    atlas = "personalities",
    pos = {x = 0, y = 0},
    rarity = "fvb_personality",
    config = {extra = {score_req = 0.75}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.score_req * 100}}
    end,
    blueprint_compat = false,
    check_for_unlock = function(self, args)
        if args.fvf_char == self.config.center_key then return true end
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if G.GAME.chips / G.GAME.blind.chips >= card.ability.extra.score_req then
                G.GAME.chips = G.GAME.blind.chips
                return {message = "Won!"}
            end
        end
    end
})
