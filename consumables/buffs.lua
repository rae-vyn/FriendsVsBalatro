SMODS.Atlas({key = "othercards", px = 71, py = 95, path = "othercards.png"})

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
            text = {"Find this buff", "in a pack to unlock"}
        }
    }
})

function use_buff(self, card, area, copier)
    if card.ability.extra.chips then -- Add chips to cards
        for _, _card in ipairs(G.hand.cards) do
            _card.ability.perma_bonus = (_card.ability.perma_bonus or 0) +
                                            card.ability.extra.chips
            _card:juice_up()
        end
    elseif card.ability.extra.damage_mult then -- Add damage to weapons
        for _, weapon in ipairs(G.weapons.cards) do
            weapon.ability.extra.min_damage =
                weapon.ability.extra.min_damage * card.ability.extra.damage_mult
            weapon.ability.extra.max_damage =
                weapon.ability.extra.max_damage * card.ability.extra.damage_mult
            weapon:juice_up()
        end
    elseif card.ability.extra.ammo_mult then -- Add ammo to weapons
        for _, weapon in ipairs(G.weapons.cards) do
            weapon.ability.extra.max_ammo = math.ceil(
                                                weapon.ability.extra.max_ammo *
                                                    card.ability.extra.ammo_mult)
            weapon.ability.extra.curr_ammo = weapon.ability.extra.max_ammo
            weapon:juice_up()
        end
    end
end

function can_use_buff(self, card)
    if card.ability.extra.type == 1 then
        return G.STAGE == G.STAGES.RUN
    else
        return true
    end
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
                type = info.type or 1 -- 1 can only be used in round
            }
        },
        loc_txt = {name = info.name, text = info.text or {"A buff."}},
        calculate = info.calculate or nil,
        use = info.use or use_buff,
        can_use = info.can_use or can_use_buff,
        unlocked = true
    })
    table.insert(FVB.cards, 'c_fvb_' .. info.key)
end

Buff({
    key = "medkit",
    name = "Medkit",
    atlas = "othercards",
    pos = {x = 10, y = 1},
    text = {"Add {C:blue}+50{} Chips", "to every card in hand"},
    chips = 50
})

Buff({
    key = "small_head",
    name = "Small Head",
    atlas = "othercards",
    pos = {x = 1, y = 0},
    text = {"Reduce {C:attention}Blind{} size", "by {C:mult}50%{}"},
    use = function(self, card, area, copier)
        G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.5)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

        local chips_UI = G.hand_text_area.blind_chips
        G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
        G.HUD_blind:recalculate()
        chips_UI:juice_up()

        play_sound('chips2')
    end
})

Buff({
    key = "steel_bullets",
    name = "Steel Bullets",
    in_pack = true,
    atlas = "othercards",
    pos = {x = 2, y = 1},
    text = {
        "Increase {C:weapon}Weapon's",
        "{C:mult}damage{} by {C:white,X:mult}50%{}"
    },
    damage_mult = 1.5,
    type = 0
})

Buff({
    key = "big_mag",
    name = "Big Mag",
    atlas = "othercards",
    pos = {x = 4, y = 1},
    in_pack = true,
    text = {
        "Increase {C:weapon}Weapon's", "{C:inactive}ammo{} by {C:green}50%{}"
    },
    ammo_mult = 1.5,
    type = 0
})

Buff({
    key = "akimbo",
    name = "Akimbo",
    in_pack = true,
    atlas = "othercards",
    pos = {x = 8, y = 2},
    text = {
        "Duplicate the {C:weapon}Weapon", "you currently have",
        "{C:inactive}(Doesn't stack)"
    },
    use = function(self, card, area, copier)
        G.weapons:change_size(1)
        local _card = copy_card(G.weapons.cards[1], nil)
        G.weapons:emplace(_card)
        G.weapons.cards[2].ability = table.copy(G.weapons.cards[1].ability)
    end,
    can_use = function(self, card) return #G.weapons.cards == 1 end,
    type = 0
})

Buff({
    key = "health_up",
    name = "Health Up",
    atlas = "othercards",
    pos = {x = 3, y = 0},
    text = {"Adds {C:blue}+10{} Chips", "per card in hand", "to each card"},
    use = function(self, card, area, copier)
        for _, _card in ipairs(G.hand.cards) do
            _card.ability.perma_bonus = (_card.ability.perma_bonus or 0) + 10 *
                                            #G.hand.cards
            _card:juice_up()
        end
    end
})

Buff({
    key = "move_faster",
    name = "Move Faster",
    atlas = "othercards",
    pos = { x = 5, y = 0 },
    text = {"Reduces Blind size", "by {C:attention}10%"},
    use = function(self, card, area, copier)
        G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.9)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

        local chips_UI = G.hand_text_area.blind_chips
        G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
        G.HUD_blind:recalculate()
        chips_UI:juice_up()

        play_sound('chips2')
    end
})

Buff({
    key = "double_jump",
    name = "Double Jump",
    atlas = "othercards",
    pos = { x = 6, y = 0},
    text = {"{C:attention}Sets scored chips to blind size", "{C:mult}-2{} hand size"},
    use = function (self, card, area, copier)
        G.GAME.chips = G.GAME.blind.chips
        G.hand:change_size(-2)
    end
})