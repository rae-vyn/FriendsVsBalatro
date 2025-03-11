
SMODS.ConsumableType({
	key = "Weapon",
	primary_colour = HEX("2A2051"),
	secondary_colour = HEX("E0569B"),
	default = "c_boira",
	loc_txt = {
		name = "Weapon",
		collection = "Weapons",
		undiscovered = {
			name = "Undiscovered Weapon",
			text = {
				"Find this weapon",
				"in a pack to unlock",
			},
		},
	},
})

function calcWeapon(self, card, context)
	if context.individual and context.cardarea == G.play and not card.ability.extra.reloading then
		local damage_range = { 0 }
		for i = 1, (card.ability.extra.max_damage - card.ability.extra.min_damage) do
			damage_range[#damage_range + 1] = i
		end
		local chosen_mult = card.ability.extra.min_damage + pseudorandom_element(damage_range, pseudoseed("boira")) -- Roll Damage
		card.ability.extra.curr_ammo = card.ability.extra.curr_ammo - 1 -- Take away ammo
		if card.ability.extra.curr_ammo <= 0 then
			card.ability.extra.reloading = true
		end
		if pseudorandom("boira") < card.ability.extra.miss_chance / 100 then
			return {
				message = "Missed!",
				message_card = context.other_card,
                func = function()
                    SMODS.calculate_context({ weapon_missed = true, other_card = context.other_card })
                    sendDebugMessage("sent weapon missed context", "ContextCheck")
                end
			}
		end
		sendDebugMessage("Ammo left: " .. card.ability.extra.curr_ammo)
		return {
			mult = chosen_mult,
			card = card,
            func = function()
                SMODS.calculate_context({ weapon_hit = true, other_card = context.other_card })
                sendDebugMessage("sent weapon missed context", "ContextCheck")
            end
		}
	elseif card.ability.extra.reloading and context.after then
		if card.ability.extra.reload_countdown > 0 then
			card.ability.extra.reload_countdown = card.ability.extra.reload_countdown - 1
			return {
				message = "Reloading...",
			}
		end
		card.ability.extra.reloading = false
		card.ability.extra.curr_ammo = card.ability.extra.max_ammo
		card.ability.extra.reload_countdown = card.ability.extra.max_reload
		return {
			message = "Reloaded!",
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
		loc_txt = {
			name = info.name,
			text = {
				info.tagline or "A weapon.",
				"{C:mult}+#1#-#2#{} Mult",
				"{C:green}#3#%{} chance to miss",
				"{C:blue}#5#{} round reload time",
				"{C:inactive}(Ammo: #4#)",
			},
		},
		loc_vars = function(self, info_queue, card)
			local curr_ammo = ""
			if card.ability.extra.reloading then
				local rel = card.ability.extra.reload_countdown
				if card.ability.extra.reload_countdown > 1 then
					curr_ammo = rel + 1 .. " hands until reload"
				else
					curr_ammo = rel + 1 .. " hand until reload"
				end
			else
				curr_ammo = card.ability.extra.curr_ammo .. "/" .. card.ability.extra.max_ammo
			end
			return {
				vars = {
					card.ability.extra.min_damage,
					card.ability.extra.max_damage,
					card.ability.extra.miss_chance,
					curr_ammo,
					card.ability.extra.max_reload
				},
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
	name = "Boomstick",
	pos = { x = 0, y = 0 },
	tagline = "Close-range clutch!",
	min_damage = 9,
	max_damage = 9 * 6,
	miss_chance = 45,
	max_ammo = 8,
	reload_time = 1,
})

Weapon({
	key = "albatross",
	name = "Albatross 21",
	pos = { x = 1, y = 0 },
	tagline = "Newton says hello!",
	min_damage = 50,
	max_damage = 90,
	miss_chance = 20,
	max_ammo = 6,
	reload_time = 6,
})

Weapon({
	key = "boira",
	name = "Boira 9",
	atlas = "boira",
	tagline = "The classic.",
	min_damage = 5,
	max_damage = 13,
	miss_chance = 25,
	max_ammo = 12,
	reload_time = 3,
})

Weapon({
	key = "brasshopper",
	name = "Brasshopper",
	pos = { x = 2, y = 0 },
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
	pos = { x = 0, y = 1 },
	tagline = "You had it coming.",
	min_damage = 40,
	max_damage = 45,
	miss_chance = 35,
	max_ammo = 6,
	reload_time = 2,
})

Weapon({
	key = "fk",
	name = "FK-82",
	pos = { x = 1, y = 1 },
	tagline = "Friends of high caliber.",
	min_damage = 12,
	max_damage = 20,
	miss_chance = 30,
	max_ammo = 31,
	reload_time = 2,
})

Weapon({
	key = "gld_boira",
	name = "Golden Boira",
	pos = { x = 2, y = 1 },
	tagline = "The gold standard.",
	min_damage = 15,
	max_damage = 21,
	miss_chance = 15,
	max_ammo = 13,
	reload_time = 3,
})

Weapon({
	key = "punchr",
	name = "Punch-R",
	pos = { x = 0, y = 2 },
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
	pos = { x = 1, y = 2 },
	tagline = "A gift from Sable.",
	min_damage = 35,
	max_damage = 45,
	max_ammo = 8,
	miss_chance = 10,
	reload_time = 3,
})
