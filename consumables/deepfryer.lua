SMODS.Consumable({
    key = "deep_fryer",
    set = "Weapon",
    atlas = "othercards",
    pos = {x = 5, y = 8},
    unlocked = true,
    config = {
        extra = {
            min_damage = 0,
            max_damage = 0,
            miss_chance = 4,
            curr_ammo = 45,
            max_ammo = 45,
            reloading = false,
            max_reload = 4,
            reload_countdown = 4,
        },
    },
    pools = { "fvb_cards", "Weapon" },
    loc_vars = function(self, info_queue, card)
        local curr_ammo = ""
        if card.ability.extra.reloading then
            local rel = card.ability.extra.reload_countdown
            curr_ammo = rel + 1 .. localize('k_fvb_until_reload')
        else
            curr_ammo = card.ability.extra.curr_ammo .. "/" .. card.ability.extra.max_ammo
        end
        local odds_num = card.ability.extra.miss_chance
        if card.ability.extra.miss_chance <= 1 then
            odds_num = card.ability.extra.miss_chance
        end
        info_queue[#info_queue+1] = G.P_CENTERS.e_fvb_fire
        return {
            vars = {
                card.ability.extra.min_damage,
                card.ability.extra.max_damage,
                odds_num,
                curr_ammo,
                card.ability.extra.max_reload,
                (G.GAME.probabilities.normal or 1)
            },
        }
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and not card.ability.extra.reloading then
            card.ability.extra.curr_ammo = card.ability.extra.curr_ammo - 1 -- Take away ammo
            if card.ability.extra.curr_ammo <= 0 then
                card.ability.extra.reloading = true
            end
            if pseudorandom("boira") <= G.GAME.probabilities.normal / card.ability.extra.miss_chance then
                local other_card = context.other_card
                eventify(function ()
                    other_card:set_edition({fvb_fire = true}, true)
                    card:juice_up()
                end)
            else
                return {
                    message = localize('k_fvb_missed')
                }
            end
        elseif card.ability.extra.reloading and context.after then
            if card.ability.extra.reload_countdown > 0 then
                card.ability.extra.reload_countdown = card.ability.extra.reload_countdown - 1
                return {
                    message = localize('k_fvb_reloading'),
                }
            end
            card.ability.extra.reloading = false
            card.ability.extra.curr_ammo = card.ability.extra.max_ammo
            card.ability.extra.reload_countdown = card.ability.extra.max_reload
            return {
                message = localize('k_fvb_reloaded'),
            }
        end
    end,
    use = function(self, card, area, copier)
        if area == G.weapons then
            SMODS.add_card({
                key = "c_fvb_boira",
            })
            card:start_dissolve()
            return
        end
        if area == G.pack_cards and #G.weapons.cards > 0 then
            for _, weapon in ipairs(G.weapons.cards) do
                weapon:start_dissolve()
            end
            return
        end
    end,
    can_use = function(self, card)
        return false
    end,
    inject = function(self)
        SMODS.Consumable.inject(self)
    end,
    add_to_deck = function(self, card, from_debuff)
        for _, weapon in ipairs(G.weapons.cards) do
            weapon:start_dissolve()
        end
    end,
    on_select = function(self, card)
        for _, weapon in ipairs(G.weapons.cards) do
            if weapon ~= card then
                weapon:start_dissolve()
            end
        end
    end,
})
table.insert(FVB.cards, "c_fvb_deep_fryer")