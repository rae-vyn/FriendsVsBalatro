SMODS.Atlas({key = "placeholder", px = 71, py = 95, path = "placeholder.png"})

SMODS.ConsumableType({
    key = 'Buff',
    primary_colour = HEX("009B84"),
    secondary_colour = HEX("009B84"),
    default = 'c_fvb_small_head',
    loc_txt = {
        name = "Buff",
        collection = "Buffs",
        undiscovered = {
            name = "Undiscovered Buff",
            text = {
                "Find this buff",
                "in a pack to unlock"
            }
        }
    },
})

function use_buff(self, card, area, copier)
    if card.ability.extra.chips then -- Add chips to cards
        for _, _card in ipairs(G.hand.cards) do
            _card.ability.perma_bonus = (_card.ability.perma_bonus or 0) + card.ability.extra.chips
            _card:juice_up()
        end
    elseif card.ability.extra.damage_mult then -- Add damage to weapons
        for _, weapon in ipairs(G.weapons.cards) do
            weapon.ability.extra.min_damage = weapon.ability.extra.min_damage * card.ability.extra.damage_mult
            weapon.ability.extra.max_damage = weapon.ability.extra.max_damage * card.ability.extra.damage_mult
            weapon:juice_up()
        end
    elseif card.ability.extra.ammo_mult then -- Add ammo to weapons
        for _, weapon in ipairs(G.weapons.cards) do
            weapon.ability.extra.max_ammo = math.ceil(weapon.ability.extra.max_ammo * card.ability.extra.ammo_mult)
            weapon.ability.extra.curr_ammo = weapon.ability.extra.max_ammo
            weapon:juice_up()
        end
    end
    card:start_dissolve()
end

function can_use_buff(self, card)
    return not (G.STATE == G.STATES.SMODS_BOOSTER_OPENED)
end

function Buff(info)
    SMODS.Consumable({
        key = info.key,
        set = "Buff",
        atlas = info.atlas or 'placeholder',
        pos = info.pos or nil,
        config = {
            extra = {
                chips = info.chips or nil,
                damage_mult = info.damage_mult or nil,
                ammo_mult = info.ammo_mult or nil,
                in_pack = info.in_pack or false,
            }
        },
        loc_txt = {
            name = info.name,
            text = info.text or {"A buff."}
        },
        calculate = info.calculate or nil,
        use = info.use or use_buff,
        can_use = info.can_use or can_use_buff
    })
    table.insert(FVB.cards, 'c_fvb_' .. info.key)
end

Buff({
    key = "medkit",
    name = "Medkit",
    text = {
        "Add {C:blue}+50{} Chips",
        "to every card in hand"
    },
    chips = 50,
})

Buff({
    key = "small_head",
    name = "Small Head",
    text = {
        "Reduce {C:attention}Blind{} size",
        "by {C:mult}50%{}",
    },
    use = function(self, card, area, copier)
        G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.5)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

        local chips_UI = G.hand_text_area.blind_chips
        G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
        G.HUD_blind:recalculate()
        chips_UI:juice_up()

        play_sound('chips2')
        card:start_dissolve()
    end
})

Buff({
    key = "steel_bullets",
    name = "Steel Bullets",
    in_pack = true,
    text = {
        "Increase {C:weapon}Weapon's",
        "{C:mult}damage{} by {C:white,X:mult}50%{}"
    },
    damage_mult = 1.5,
})

Buff({
    key = "big_mag",
    name = "Big Mag",
    in_pack = true,
    text = {
        "Increase {C:weapon}Weapon's",
        "{C:inactive}ammo{} by {C:green}50%{}"
    },
    ammo_mult = 1.5
})

Buff({
    key = "akimbo",
    name = "Akimbo",
    in_pack = true,
    text = {
        "Duplicate the {C:weapon}Weapon",
        "you currently have",
        "{C:inactive}(Doesn't stack)"
    },
    use = function(self, card, area, copier)
        G.weapons:change_size(1)
        SMODS.add_card({key = G.weapons.cards[1].config.center_key})
        G.weapons.cards[2].ability = table.copy(G.weapons.cards[1].ability)
    end
})

Buff({
    key = "health_up",
    name = "Health Up",
    text = {
        "{C:blue}+10{} Chips",
        "per card in hand"
    },
    use = function(self, card, area, copier)
        for _, _card in ipairs(G.hand.cards) do
            _card.ability.perma_bonus = (_card.ability.perma_bonus or 0) + 10 * #G.hand.cards
            _card:juice_up()
        end
    end
})
