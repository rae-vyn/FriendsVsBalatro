SMODS.Atlas({key = "placeholder", px = 71, py = 95, path = "placeholder.png"})

SMODS.ConsumableType({
    key = 'Weapon',
    primary_colour = HEX("2A2051"),
    secondary_colour = HEX("E0569B"),
    default = 'c_boira',
    loc_txt = {
        name = "Weapon",
        collection = "Weapons",
        undiscovered = {
            name = "Undiscovered Weapon",
            text = {
                "Find this weapon",
                "in a pack to unlock"
            }
        }
    },
})

function calcWeapon(self, card, context)
    if context.individual and context.cardarea == G.play and not card.ability.extra.reloading then
        local damage_range = {0}
        for i = 1, (card.ability.extra.max_damage-card.ability.extra.min_damage) do
            damage_range[#damage_range+1] = i
        end
        local chosen_mult = 13 + pseudorandom_element(damage_range, pseudoseed("boira")) -- Roll Damage
        card.ability.extra.curr_ammo = card.ability.extra.curr_ammo - 1 -- Take away ammo
        if card.ability.extra.curr_ammo <= 0 then
            card.ability.extra.reloading = true
        end
        if pseudorandom('boira') < card.ability.extra.miss_chance/100 then
            return {
                message = "Missed!"
            }
        end
        sendDebugMessage("Ammo left: " .. card.ability.extra.curr_ammo)
        return {
            mult = chosen_mult,
            card = card,
        }
    elseif card.ability.extra.reloading and context.after then
        if card.ability.extra.reload_countdown > 0 then
            card.ability.extra.reload_countdown = card.ability.extra.reload_countdown - 1
            return {
                message = "Reloading..."
            }
        end
        card.ability.extra.reloading = false
        card.ability.extra.curr_ammo = card.ability.extra.max_ammo
        card.ability.extra.reload_countdown = card.ability.extra.max_reload
        return {
            message = "Reloaded!"
        }
    end
end

local function Weapon(info)
    SMODS.Consumable({
        key = info.key,
        set = "Weapon",
        atlas = info.atlas or 'placeholder',
        config = {
            extra = {
                min_damage = info.min_damage,
                max_damage = info.max_damage,
                miss_chance = info.miss_chance,
                curr_ammo = info.curr_ammo or info.max_ammo,
                max_ammo = info.max_ammo,
                reloading = false,
                max_reload = info.reload_time,
                reload_countdown = info.reload_countdown or info.reload_time
            }
        },
        loc_txt = {
            name = info.name,
            text = {
                info.tagline or "A weapon.",
                "{C:mult}+#1#-#2#{} Mult",
                "{C:green}#3#%{} chance to miss",
                "{C:inactive}(Current ammo: #4#)",
            },
        },
        loc_vars = function(self, info_queue, card)
            local curr_ammo = ""
            if card.ability.extra.reloading then
                local rel = card.ability.extra.reload_countdown
                if card.ability.extra.reload_countdown > 1 and (not rel == 0) then
                    curr_ammo = rel + 1 .. " hands until reload"
                else
                    curr_ammo = rel + 1 .. " hand until reload"
                end
            else
                curr_ammo = card.ability.extra.curr_ammo .. "/" .. card.ability.extra.max_ammo
            end
            return {
                vars = { card.ability.extra.min_damage, card.ability.extra.max_damage, card.ability.extra.miss_chance, curr_ammo },
            }
        end,
        calculate = info.calculate or calcWeapon,
        use = function(self, card, area, copier)
            G.weapon:emplace(self)
        end,
        keep_on_use = function(self, card)
            return true
        end
    })
end

Weapon({
    key = "boomstick",
    name = "Boomstick",
    tagline = "Close-range clutch!",
    min_damage = 13,
    max_damage = 13*6,
    miss_chance = 45,
    max_ammo = 8,
    reload_time = 1,
})

Weapon({
    key = "albatross",
    name = "Albatross 21",
    tagline = "Newton says hello!",
    min_damage = 70,
    max_damage = 100,
    miss_chance = 20,
    max_ammo = 6,
    reload_time = 6,
})

Weapon({
    key = "boira",
    name = "Boira 9",
    tagline = "The classic.",
    min_damage = 13,
    max_damage = 19,
    miss_chance = 25,
    max_ammo = 12,
    reload_time = 3,
})

Weapon({
    key = "brasshopper",
    name = "Brasshopper",
    tagline = "A bit of the Raver flavour.",
    min_damage = 8,
    max_damage = 12,
    miss_chance = 32,
    max_ammo = 35,
    reload_time = 1,
})

Weapon({
    key = "laika",
    name = "Laika",
    tagline = "You had it coming.",
    min_damage = 39,
    max_damage = 45,
    miss_chance = 35,
    max_ammo = 6,
    reload_time = 2,
})

Weapon({
    key = "laika",
    name = "Laika",
    tagline = "You had it coming.",
    min_damage = 39,
    max_damage = 45,
    miss_chance = 35,
    max_ammo = 6,
    reload_time = 2,
})

Weapon({
    key = "fk",
    name = "FK-82",
    tagline = "Friends of high caliber.",
    min_damage = 16,
    max_damage = 19,
    miss_chance = 30,
    max_ammo = 31,
    reload_time = 2
})

Weapon({
    key = "gld_boira",
    name = "Golden Boira",
    tagline = "The gold standard.",
    min_damage = 15,
    max_damage = 21,
    miss_chance = 15,
    max_ammo = 13,
    reload_time = 3
})

Weapon({
    key = "punchr",
    name = "Punch-R",
    tagline = "Lars' specialty.",
    min_damage = 40,
    max_damage = 60,
    max_ammo = 4,
    miss_chance = 50,
    reload_time = 4,
})

Weapon({
    key = "katana",
    name = "Katana",
    tagline = "A gift from Sable.",
    min_damage = 45,
    max_damage = 55,
    max_ammo = 8,
    miss_chance = 10,
    reload_time = 3,
})