SMODS.Atlas({
	key = "personalities",
	px = 71,
	py = 95,
	path = "personalities.png",
})

SMODS.Rarity({
	key = "personality",
	loc_txt = { name = "Personality" },
	badge_colour = HEX("E7680D"),
})

SMODS.Joker({
	key = "donnie_b",
	atlas = "personalities",
	pos = { x = 3, y = 0 },
	config = { extra = { chips = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
	end,
	rarity = "fvb_personality",
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not context.blueprint then
			if context.other_card:get_id() == 12 then
				card.ability.extra.chips = card.ability.extra.chips + 200
				return { message = "Upgraded!", message_card = card }
			end
		end
		if context.joker_main then
			return { chips = card.ability.extra.chips }
		end
	end,
})

SMODS.Joker({
	key = "stevie_gull",
	atlas = "personalities",
	pos = { x = 2, y = 3 },
	config = { extra = { damage = 15 } },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			-- Set GB reload
			for _, weapon in ipairs(G.weapons.cards) do
				if weapon.config.center_key == "c_fvb_golden_boira" then
					weapon.ability.extra.reloading = false
					weapon.ability.extra.curr_ammo = weapon.ability.extra.max_ammo
					weapon.ability.extra.reload_countdown = weapon.ability.extra.max_reload
				end
				weapon.ability.extra.min_damage = weapon.ability.extra.min_damage + 5
				weapon.ability.extra.max_damage = weapon.ability.extra.max_damage + 5
			end
		end
	end,
})

SMODS.Joker({
	key = "spike_remington",
	atlas = "personalities",
	pos = { x = 1, y = 3 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not context.blueprint then
			if context.other_card:get_id() == 14 then
				for _, weapon in ipairs(G.weapons.cards) do
					weapon.ability.extra.min_damage = weapon.ability.extra.min_damage + 20
					weapon.ability.extra.max_damage = weapon.ability.extra.max_damage + 20
					weapon:juice_up()
				end
				return { message = "Buffed!" }
			end
		end
	end,
})

SMODS.Joker({
	key = "sable_santana",
	atlas = "personalities",
	pos = { x = 5, y = 2 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			-- Set GB reload
			for _, weapon in ipairs(G.weapons.cards) do
				if weapon.config.center_key == "c_fvb_katana" then
					weapon.ability.extra.reloading = false
					weapon.ability.extra.curr_ammo = weapon.ability.extra.max_ammo
					weapon.ability.extra.reload_countdown = weapon.ability.extra.max_reload
				end
				weapon.ability.extra.min_damage = weapon.ability.extra.min_damage * 1.5
				weapon.ability.extra.max_damage = weapon.ability.extra.max_damage * 1.5
			end
		end
	end,
})

SMODS.Joker({
	key = "duck_anderson",
	atlas = "personalities",
	pos = { x = 0, y = 1 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			SMODS.add_card({ key = "c_fvb_green_herb" })
			card:juice_up()
		end
	end,
})

SMODS.Joker({
	key = "dj_newton",
	atlas = "personalities",
	pos = { x = 5, y = 0 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			for _, weapon in ipairs(G.weapons.cards) do
				weapon.ability.extra.miss_chance = weapon.ability.extra.miss_chance - 5
				if weapon.ability.extra.miss_chance == 0 then
					weapon.ability.extra.miss_chance = 0
				end
				weapon:juice_up()
			end
			return { message = "Buffed!" }
		end
	end,
})

SMODS.Joker({
	key = "moose_salto",
	atlas = "personalities",
	config = { extra = { skip_count = 0, xmult = 2, pow = 1 } },
	pos = { x = 3, y = 2 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.pow } }
	end,
	rarity = "fvb_personality",
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.skip_blind and card.ability.extra.skip_count == 1 then
			card.ability.extra.skip_count = 0
			card.ability.extra.pow = card.ability.extra.pow + 1
			card.ability.extra.xmult = 2 ^ card.ability.extra.pow
			return { message = "Buffed!", message_card = card }
		elseif context.skip_blind then
			card.ability.extra.skip_count = card.ability.extra.skip_count + 1
		end
		if context.joker_main then
			return { xmult = card.ability.extra.xmult }
		end
	end,
})

SMODS.Joker({
	key = "myk_raver",
	atlas = "personalities",
	pos = { x = 4, y = 2 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			-- Set GB reload
			for _, weapon in ipairs(G.weapons.cards) do
				if weapon.config.center_key == "c_fvb_brasshopper" then
					weapon.ability.extra.max_ammo = weapon.ability.extra.max_ammo * 2
				end
			end
		end
	end,
})

SMODS.Joker({
	key = "little_lars",
	atlas = "personalities",
	pos = { x = 1, y = 2 },
	config = { extra = { blind_reduction = 0.75 } },
	loc_vars = function(self, info_queue, card)
		local formatted = (1 - card.ability.extra.blind_reduction) * 100
		return { vars = { formatted } }
	end,
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.first_hand_drawn and not context.blueprint then
			G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.75)
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

			local chips_UI = G.hand_text_area.blind_chips
			G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
			G.HUD_blind:recalculate()
			chips_UI:juice_up()

			play_sound("chips2")
		end
		if context.end_of_round and G.GAME.blind.boss and not context.blueprint then
			card.ability.extra.blind_reduction = card.ability.blind_reduction - 0.05
			return {
				message = "Buffed!",
			}
		end
	end,
})

SMODS.Joker({
	key = "haru",
	atlas = "personalities",
	pos = { x = 1, y = 1 },
	config = { extra = { xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	rarity = "fvb_personality",
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.skip_blind then
			card.ability.extra.xmult = 1
			return {
				message = "Reset!",
			}
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.xmult = card.ability.extra.xmult + 1
			return {
				message = "Accelerating!",
			}
		end
	end,
})

SMODS.Joker({
	key = "klustr",
	atlas = "personalities",
	pos = { x = 4, y = 1 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			--[[
            SMODS.create_card({
                key = "j_fvb_dither"
            })
            SMODS.create_card({
                key = "j_fvb_banding"
            })
            ]]
			return {
				message = "TBD",
			}
		end
	end,
})

SMODS.Joker({
	key = "ribberto",
	atlas = "personalities",
	pos = { x = 5, y = 1 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.before and next(context.poker_hands["Straight Flush"]) and not context.blueprint then
            card:juice_up()
            SMODS.add_card({
                rarity = "fvb_personality"
            })
		end
	end,
})

SMODS.Joker({
	key = "margarita",
	atlas = "personalities",
	pos = { x = 2, y = 2 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			--[[
            SMODS.create_card({
                key = "j_fvb_dither"
            })
            SMODS.create_card({
                key = "j_fvb_banding"
            })
            ]]
			return {
				message = "TBD",
			}
		end
	end,
})

SMODS.Joker({
	key = "dale",
	atlas = "personalities",
	pos = { x = 1, y = 0 },
	rarity = "fvb_personality",
    config = {extra = {mult = 1}},
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.mult}}
    end,
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			local target = context.scoring_hand[#context.scoring_hand]
            if context.other_card == target then
                if context.other_card:get_id() == 14 then
                    card.ability.extra.mult = card.ability.extra.mult + 1
                    return {
                        message = "Upgraded!"
                    }
                end
                return {
                    message = "Again!"
                }
            end
		end
        if context.joker_main then
            return {
                xmult = card.ability.config.mult
            }
        end
	end,
})

SMODS.Joker({
	key = "dingo",
	atlas = "personalities",
	pos = { x = 2, y = 0 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			--[[
            SMODS.create_card({
                key = "j_fvb_dither"
            })
            SMODS.create_card({
                key = "j_fvb_banding"
            })
            ]]
			return {
				message = "TBD",
			}
		end
	end,
})

SMODS.Joker({
	key = "siaro",
	atlas = "personalities",
	pos = { x = 0, y = 3 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			--[[
            SMODS.create_card({
                key = "j_fvb_dither"
            })
            SMODS.create_card({
                key = "j_fvb_banding"
            })
            ]]
			return {
				message = "TBD",
			}
		end
	end,
})

SMODS.Joker({
	key = "jawhara",
	atlas = "personalities",
	pos = { x = 2, y = 1 },
    config = {extra = {mult = 1}},
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.mult}}
    end,
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		--[[ if context.setting_blind and not context.blueprint then

		end]]
        if context.joker_main then
            return {
                xmult = card.ability.extra.mult
            }
        end
	end,
})

SMODS.Joker({
	key = "laika",
	atlas = "personalities",
	pos = { x = 0, y = 2 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			--[[
            SMODS.create_card({
                key = "j_fvb_dither"
            })
            SMODS.create_card({
                key = "j_fvb_banding"
            })
            ]]
			return {
				message = "TBD",
			}
		end
	end,
})

SMODS.Joker({
	key = "dooper",
	atlas = "personalities",
	pos = { x = 4, y = 0 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			--[[
            SMODS.create_card({
                key = "j_fvb_dither"
            })
            SMODS.create_card({
                key = "j_fvb_banding"
            })
            ]]
			return {
				message = "TBD",
			}
		end
	end,
})

SMODS.Joker({
	key = "ktqtpi",
	atlas = "personalities",
	pos = { x = 3, y = 1 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			--[[
            SMODS.create_card({
                key = "j_fvb_dither"
            })
            SMODS.create_card({
                key = "j_fvb_banding"
            })
            ]]
			return {
				message = "TBD",
			}
		end
	end,
})

SMODS.Joker({
	key = "bach",
	atlas = "personalities",
	pos = { x = 0, y = 0 },
	rarity = "fvb_personality",
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			--[[
            SMODS.create_card({
                key = "j_fvb_dither"
            })
            SMODS.create_card({
                key = "j_fvb_banding"
            })
            ]]
			return {
				message = "TBD",
			}
		end
	end,
})
