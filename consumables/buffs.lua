SMODS.Atlas({ key = "othercards", px = 71, py = 95, path = "othercards.png" })

SMODS.ConsumableType({
	key = "Buff",
	primary_colour = HEX("009B84"),
	secondary_colour = HEX("009B84"),
	default = "c_fvb_small_head",
	loc_txt = {
		name = "Buff",
		collection = "Buffs",
		undiscovered = {
			name = "Undiscovered Buff",
			text = { "Find this buff", "in a pack to unlock" },
		},
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
		atlas = info.atlas or "placeholder",
		pos = info.pos or nil,
		config = {
			extra = {
				chips = info.chips or nil,
				damage_mult = info.damage_mult or nil,
				ammo_mult = info.ammo_mult or nil,
				in_pack = info.in_pack or false,
				type = info.type or 1, -- 1 can only be used in round
			},
		},
		calculate = info.calculate or nil,
		use = info.use or use_buff,
		can_use = info.can_use or can_use_buff,
		unlocked = true,
	})
	table.insert(FVB.cards, "c_fvb_" .. info.key)
end

Buff({
	key = "medkit",
	name = "Medkit",
	atlas = "othercards",
	pos = { x = 10, y = 1 },
	text = { "Add {C:blue}+50{} Chips", "to every card in hand" },
	chips = 50,
	can_use = function(self, card)
		return (#G.hand.cards > 0)
	end,
})

Buff({
	key = "small_head",
	atlas = "othercards",
	pos = { x = 1, y = 0 },
	use = function(self, card, area, copier)
		G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.5)
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

		local chips_UI = G.hand_text_area.blind_chips
		G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
		G.HUD_blind:recalculate()
		chips_UI:juice_up()

		play_sound("chips2")
	end,
	can_use = function(self, card)
		return G.GAME.blind.chips > 0
	end,
})

Buff({
	key = "steel_bullets",
	
	in_pack = true,
	atlas = "othercards",
	pos = { x = 2, y = 1 },
	
	damage_mult = 1.5,
	type = 0,
})

Buff({
	key = "big_mag",
	
	atlas = "othercards",
	pos = { x = 4, y = 1 },
	in_pack = true,
	
	ammo_mult = 1.5,
	type = 0,
})

Buff({
	key = "akimbo",
	
	in_pack = true,
	atlas = "othercards",
	pos = { x = 8, y = 2 },
	
	use = function(self, card, area, copier)
		G.weapons:change_size(1)
		local _card = copy_card(G.weapons.cards[1], nil)
		G.weapons:emplace(_card)
		G.weapons.cards[2].ability = table.copy(G.weapons.cards[1].ability)
	end,
	can_use = function(self, card)
		return #G.weapons.cards == 1
	end,
	type = 0,
})

Buff({
	key = "health_up",
	
	atlas = "othercards",
	pos = { x = 3, y = 0 },
	
	use = function(self, card, area, copier)
		for _, _card in ipairs(G.hand.cards) do
			_card.ability.perma_bonus = (_card.ability.perma_bonus or 0) + 10 * #G.hand.cards
			_card:juice_up()
		end
	end,
	can_use = function(self, card)
		return (#G.hand.cards > 0)
	end,
})

Buff({
	key = "move_faster",
	
	atlas = "othercards",
	pos = { x = 5, y = 0 },
	
	use = function(self, card, area, copier)
		G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.9)
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

		local chips_UI = G.hand_text_area.blind_chips
		G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
		G.HUD_blind:recalculate()
		chips_UI:juice_up()

		play_sound("chips2")
	end,
	can_use = function(self, card)
		return G.GAME.blind.chips > 0
	end,
})

Buff({
	key = "double_jump",
	
	atlas = "othercards",
	pos = { x = 6, y = 0 },
	
	use = function(self, card, area, copier)
		G.GAME.chips = G.GAME.blind.chips
		G.hand:change_size(-2)
	end,
	can_use = function(self, card)
		return G.GAME.blind.chips > G.GAME.chips
	end,
})

Buff({
	key = "more_accuracy",
	
	atlas = "othercards",
	pos = { x = 0, y = 1 },
	
	use = function(self, card, area, copier)
		for _, weapon in ipairs(G.weapons.cards) do
			weapon.ability.extra.miss_chance = weapon.ability.extra.miss_chance - 10
			if weapon.ability.extra.miss_chance <= 0 then
				weapon.ability.extra.miss_chance = 0
			end
			weapon:juice_up()
		end
	end,
})

Buff({
	key = "quick_reload",
	
	atlas = "othercards",
	pos = { x = 6, y = 1 },
	
	use = function(self, card, area, copier)
		for _, weapon in ipairs(G.weapons.cards) do
			weapon.ability.extra.max_reload = weapon.ability.extra.max_reload - 1
			if weapon.ability.extra.max_reload <= 1 then
				weapon.ability.extra.max_reload = 1
			end
			weapon:juice_up()
		end
	end,
})

Buff({
	key = "vampire_bullets",
	
	atlas = "othercards",
	pos = { x = 5, y = 2 },
	
	calculate = function(self, card, context)
		if context.weapon_hit then
			return {
				message = "-100!",
                message_card = card,
				func = function()
                    eventify( function()
                        G.GAME.blind.chips = G.GAME.blind.chips - 100
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                        local chips_UI = G.hand_text_area.blind_chips
                        G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                        G.HUD_blind:recalculate()
                        chips_UI:juice_up()

                        play_sound("chips2")
                    end)
				end,
			}
		end
	end,
	can_use = function(self, card)
		return false
	end,
})

Buff({
	key = "extra_cards",
	
	atlas = "othercards",
	pos = { x = 3, y = 4 },
	
	use = function(self, card, area, copier)
		if G.hand then
			G.FUNCS.draw_from_deck_to_hand(3)
		end
	end,
	can_use = function(self, card)
		return (#G.deck.cards > 0) and (#G.hand.cards > 0)
	end,
})

Buff({
	key = "energy_drink",
	atlas = "othercards",
	pos = { x = 6, y = 2 },
	
	calculate = function(self, card, context)
		if context.skip_blind then
			G.E_MANAGER:add_event(Event({
				trigger = "immediate",
				func = function()
					ease_dollars(5)
					card:start_dissolve()
					return true
				end,
			}))
		end
	end,
	can_use = function(self, card)
		return false
	end,
})
Buff({
	key = "helmet",
	
	atlas = "othercards",
	pos = { x = 7, y = 2 },
	
	calculate = function(self, card, context)
		if context.weapon_hit then
			return {
				message = "hit!",
                message_card = card,
				func = function()
					G.GAME.blind.chips = G.GAME.blind.chips - 100
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

					local chips_UI = G.hand_text_area.blind_chips
					G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
					G.HUD_blind:recalculate()
					chips_UI:juice_up()

					play_sound("chips2")
				end,
			}
		end
	end,
})
Buff({
	key = "poison_bullets",
	
	atlas = "othercards",
	pos = { x = 1, y = 3 },
	
	calculate = function(self, card, context)
		if context.weapon_hit then
			context.other_card:set_seal("fvb_poison", true, true)
			card:juice_up()
		end
	end,
	can_use = function(self, card)
		return false
	end,
})
Buff({
	key = "tin_man",
	
	atlas = "othercards",
	pos = { x = 3, y = 3 },
	
	calculate = function(self, card, context)
		if context.weapon_missed then
			return {
                func = function()
                    eventify(function()
                        context.other_card:set_ability(G.P_CENTERS.m_steel)
                        context.other_card:juice_up()
                    end)
                end
            }
		end
	end,
	can_use = function(self, card)
		return false
	end,
})

Buff({
	key = "card_profaner",
	
	atlas = "othercards",
	pos = { x = 4, y = 4 },
	
	use = function(self, card, area, copier)
		for i = 1, 3 do
			draw_card(G.discard, G.hand, i * 100 / 3, nil, nil, nil, 0.07)
		end
	end,
	can_use = function(self, card)
		return #G.discard.cards > 0
	end,
})

Buff({
	key = "card_thief",
	
	atlas = "othercards",
	pos = { x = 5, y = 4 },
	
	use = function(self, card, area, copier)
		SMODS.add_card({ set = "Buff" })
	end,
})
