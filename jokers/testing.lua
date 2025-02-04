return {
	key = "c_fvb_boira",
	set = "Weapon",
	atlas = "placeholder",
	config = {
		extra = {
			min_damage = 13,
			max_damage = 19,
			miss_chance = 25,
			curr_ammo = 12,
			max_ammo = 12,
			reloading = false,
            reload_countdown = 3
		},
	},
	loc_txt = {
		name = "Boira",
		text = {
			"The classic.",
			"{C:mult}+#1#-#2#{} Mult",
			"{C:green}#3#%{} chance to miss",
			"{C:inactive}(Current ammo: #4#)",
		},
	},
	loc_vars = function(self, info_queue, card)
        local curr_ammo = ""
        if card.ability.extra.reloading then
            curr_ammo = "Reloading"
        else
            curr_ammo = card.ability.extra.curr_ammo .. "/" .. card.ability.extra.max_ammo
        end
		return {
			vars = { card.ability.extra.min_damage, card.ability.extra.max_damage, card.ability.extra.miss_chance, curr_ammo },
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not card.ability.extra.reloading then
			local chosen_mult = 13 + pseudorandom_element({ 0, 1, 2, 3, 4, 5, 6 }, pseudoseed("boira"))
            card.ability.extra.curr_ammo = card.ability.extra.curr_ammo - 1
            if card.ability.extra.curr_ammo <= 0 then
                card.ability.extra.reloading = true
            end
			return {
				mult = chosen_mult,
				card = card,
			}
		elseif card.ability.extra.reloading and context.final_scoring_step then
            if card.ability.extra.reload_countdown >= 0 then
                card.ability.extra.reload_countdown = card.ability.extra.reload_countdown - 1
                return {
                    message = "Reloading..."
                }
            end
            card.ability.extra.reloading = false
            card.ability.extra.curr_ammo = card.ability.extra.max_ammo
            return {
                message = "Reloaded!"
            }
        end
	end,
}
