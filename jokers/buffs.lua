SMODS.Atlas({key = "placeholder", px = 71, py = 95, path = "placeholder.png"})

local BUFF_KEYS = {
    "small_head",
    "health_up",
    "steel_bullets",
    "big_mag",
    "akimbo"
}

SMODS.Joker({
    key = "small_head",
    atlas = "placeholder",
    config = {extra = {reduction = 50}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.reduction}}
    end,
    rarity = 3,
    calculate = function(self, card, context)
        if context.blueprint then return end
        if context.selling_self then
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.5)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

            local chips_UI = G.hand_text_area.blind_chips
            G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
            G.HUD_blind:recalculate()
            chips_UI:juice_up()
            card:juice_up()

            play_sound('chips2')
        end
    end
})

SMODS.Joker({
    key = "health_up",
    atlas = "placeholder",
    config = {extra = {chips = 40}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,
    rarity = 1,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips * #context.scoring_hand
            }
        end
    end
})

SMODS.Joker({
    key = "steel_bullets",
    atlas = "placeholder",
    config = {extra = {xmult = 1.5}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,
    rarity = 1,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult * #context.scoring_hand
            }
        end
    end
})

SMODS.Joker({
    key = "big_mag",
    atlas = "placeholder",
    config = {extra = {mult = 0.3}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult * 100}}
    end,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.selling_self then
            for _, weapon in ipairs(G.weapons.cards) do
                weapon.ability.extra.max_ammo = weapon.ability.extra.max_ammo + math.ceil(weapon.ability.extra.max_ammo * card.ability.extra.mult)
                weapon.ability.extra.curr_ammo = weapon.ability.extra.max_ammo
                weapon:juice_up()
            end
        end
    end
})

SMODS.Joker({
    key = "akimbo",
    atlas = "placeholder",
    calculate = function (self, card, context)
        if context.selling_self and #G.weapons.cards == 1 then
            G.weapons:change_size(1)
            SMODS.add_card({key = G.weapons.cards[1].config.center_key})
            G.weapons.cards[2].ability = table.copy(G.weapons.cards[1].ability)
        end
    end
})

for _, v in ipairs(BUFF_KEYS) do
    table.insert(FVB.cards, "j_fvb_" .. v)
end
