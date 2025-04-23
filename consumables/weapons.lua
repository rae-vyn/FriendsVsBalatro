SMODS.ConsumableType({
	key = "Weapon",
	primary_colour = HEX("2A2051"),
	secondary_colour = HEX("E0569B"),
	default = "c_boira",
})

function calcWeapon(self, card, context)
	if context.individual and context.cardarea == G.play and not card.ability.extra.reloading then
		local damage_range = { 0 }
		for i = card.ability.extra.min_damage, card.ability.extra.max_damage do
			damage_range[#damage_range + 1] = i
		end
		local chosen_mult = pseudorandom_element(damage_range, pseudoseed("boira")) -- Roll Damage
		card.ability.extra.curr_ammo = card.ability.extra.curr_ammo - 1 -- Take away ammo
		if card.ability.extra.curr_ammo <= 0 then
			card.ability.extra.reloading = true
		end
		if pseudorandom("boira") <= card.ability.extra.miss_chance / 100 then
			return {
				message = localize('k_fvb_missed'),
				message_card = context.other_card,
				func = function()
					SMODS.calculate_context({ weapon_missed = true, other_card = context.other_card })
					sendDebugMessage("sent weapon missed context", "ContextCheck")
				end,
			}
		end
		sendDebugMessage("Ammo left: " .. card.ability.extra.curr_ammo)
		return {
			mult = chosen_mult,
			-- card = card,
			func = function()
				SMODS.calculate_context({ weapon_hit = true, other_card = context.other_card })
				sendDebugMessage("sent weapon missed context", "ContextCheck")
			end,
		}
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
end

local function Weapon(info)
	SMODS.Consumable({
		key = info.key,
		set = "Weapon",
		atlas = info.atlas or "weapons",
		pos = info.pos or nil,
		unlocked = true,
		config = {
			extra = {
				min_damage = info.min_damage,
				max_damage = info.max_damage,
				miss_chance = info.miss_chance,
				curr_ammo = info.curr_ammo or info.max_ammo,
				max_ammo = info.max_ammo,
				reloading = false,
				max_reload = info.reload_time,
				reload_countdown = info.reload_countdown or info.reload_time,
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
			return {
				vars = {
					card.ability.extra.min_damage,
					card.ability.extra.max_damage,
					card.ability.extra.miss_chance,
					curr_ammo,
					card.ability.extra.max_reload,
				},
				main_end = {
                    {n=G.UIT.C, config={align = "bm", minh = 0.4}, nodes={
                        {n=G.UIT.C, config={ref_table = self, align = "m", colour = G.C.GREEN, r = 0.05, padding = 0.06}, nodes={
                            {n=G.UIT.T, config={text = ' '..localize('k_fvb_no_oops')..' ',colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.9}},
                        }}
                    }}
                }
			}
		end,
		calculate = info.calculate or calcWeapon,
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
	table.insert(FVB.cards, "c_fvb_" .. info.key)
end

Weapon({
	key = "boomstick",

	pos = { x = 0, y = 0 },

	min_damage = 9,
	max_damage = 9 * 6,
	miss_chance = 60,
	max_ammo = 8,
	reload_time = 1,
})

Weapon({
	key = "albatross",

	pos = { x = 1, y = 0 },

	min_damage = 25,
	max_damage = 50,
	miss_chance = 20,
	max_ammo = 6,
	reload_time = 6,
})

Weapon({
	key = "boira",

	atlas = "boira",

	min_damage = 1,
	max_damage = 8,
	miss_chance = 25,
	max_ammo = 12,
	reload_time = 3,
})

Weapon({
	key = "brasshopper",

	pos = { x = 2, y = 0 },

	min_damage = 2,
	max_damage = 10,
	miss_chance = 32,
	max_ammo = 35,
	reload_time = 1,
})

Weapon({
	key = "laika",

	pos = { x = 0, y = 1 },

	min_damage = 40,
	max_damage = 45,
	miss_chance = 35,
	max_ammo = 6,
	reload_time = 2,
})

Weapon({
	key = "fk",

	pos = { x = 1, y = 1 },

	min_damage = 10,
	max_damage = 18,
	miss_chance = 30,
	max_ammo = 31,
	reload_time = 2,
})

Weapon({
	key = "gld_boira",

	pos = { x = 2, y = 1 },

	min_damage = 15,
	max_damage = 21,
	miss_chance = 15,
	max_ammo = 13,
	reload_time = 3,
})

Weapon({
	key = "punchr",

	pos = { x = 0, y = 2 },

	min_damage = 40,
	max_damage = 60,
	max_ammo = 4,
	miss_chance = 50,
	reload_time = 4,
})

Weapon({
	key = "katana",

	pos = { x = 1, y = 2 },

	min_damage = 35,
	max_damage = 45,
	max_ammo = 8,
	miss_chance = 10,
	reload_time = 3,
})

assert(SMODS.load_file("consumables/deepfryer.lua"))()