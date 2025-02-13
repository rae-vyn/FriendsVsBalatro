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
    pos = {x = 5, y = 0},
    config = {extra = {chips = 0}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            not context.blueprint then
            if context.other_card:get_id() == 12 then
                card.ability.extra.chips = card.ability.extra.chips + 200
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
    pos = {x = 4, y = 0},
    config = {extra = {damage = 15}},
    rarity = "fvb_personality",
    blueprint_compat = false,
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
                end
                weapon.ability.extra.min_damage =
                    weapon.ability.extra.min_damage + 5
                weapon.ability.extra.max_damage =
                    weapon.ability.extra.max_damage + 5
            end
        end
    end
})

SMODS.Joker({
    key = "spike_remington",
    atlas = "personalities",
    pos = {x = 3, y = 0},
    rarity = "fvb_personality",
    blueprint_compat = false,
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
    pos = {x = 2, y = 1},
    rarity = "fvb_personality",
    blueprint_compat = false,
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
    pos = {x = 1, y = 0},
    rarity = "fvb_personality",
    blueprint_compat = false,
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
    pos = {x = 0, y = 0},
    rarity = "fvb_personality",
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            for _, weapon in ipairs(G.weapons.cards) do
                weapon.ability.extra.miss_chance =
                    weapon.ability.extra.miss_chance - 5
                if weapon.ability.extra.miss_chance == 0 then
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
    pos = {x = 2, y = 0},
    loc_vars = function (self, info_queue, card)
        return { vars = {card.ability.extra.pow}}
    end,
    rarity = "fvb_personality",
    blueprint_compat = true,
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
    pos = {x = 0, y = 1},
    rarity = "fvb_personality",
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            -- Set GB reload
            for _, weapon in ipairs(G.weapons.cards) do
                if weapon.config.center_key == "c_fvb_brasshopper" then
                    weapon.ability.extra.max_ammo =
                        weapon.ability.extra.max_ammo * 2
                end
            end
        end
    end
})
