SMODS.Atlas({
	key = "card_backs",
	px = 71,
	py = 95,
	path = "backs_sheet.png",
})

SMODS.Back({
	key = "friends_deck",
	atlas = "card_backs",
	pos = { x = 7, y = 8 },
	loc_txt = {
		name = "Friends Deck",
		text = {
			"Start with a random",
			"{C:purple,E:1,T:m_eternal}Eternal{} {C:personality}Personality{} card",
		},
	},
	unlocked = true,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				local card = SMODS.add_card({
					set = "Joker",
					rarity = "fvb_personality",
					stickers = { "eternal" },
				})
				check_for_unlock({ fvb_char = card.config.center_key })
				return true
			end,
		}))
	end,
})

SMODS.Back({
	key = "baba_deck",
	atlas = "card_backs",
	pos = { x = 0, y = 0 },
	loc_txt = {
		name = "Baba's Deck",
		text = {
			"Start with a deck",
			"Of {C:attention}Gold{} {C:mult}Hearts",
		},
	},
	unlocked = true,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				for _, card in ipairs(G.playing_cards) do
					SMODS.change_base(card, "Hearts")
					card:set_ability(G.P_CENTERS.m_gold)
				end
				return true
			end,
		}))
	end,
})

SMODS.Back({
	key = "siaro_deck",
	loc_txt = {
		name = "Siaro's Deck",
		text = {
			"Start with a deck",
			"Of {C:green}Poison{} cards",
		},
	},
	atlas = "card_backs",
	pos = { x = 6, y = 4 },
	unlocked = true,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				for _, card in ipairs(G.playing_cards) do
					card:set_seal("fvb_poison", true, true)
				end
				return true
			end,
		}))
	end,
})

SMODS.Back({
	key = "schema_deck",
	loc_txt = {
		name = "Schema Deck",
		text = {
			"Get a free {C:blue,T:j_blueprint}Blueprint",
			"every three {C:attention}Antes",
		},
	},
	config = {
		extra = {
			ante_counter = 3,
			last_ante = 1,
		},
	},
	atlas = "card_backs",
	pos = { x = 7, y = 7 },
	unlocked = true,
	apply = function(self, back) end,
	calculate = function(self, back, context)
		if
			context.end_of_round
			and not context.individual
			and not context.repetition
			and context.cardarea == G.hand
			and G.GAME.blind:get_type() == "Boss"
		then
			self.config.extra.ante_counter = self.config.extra.ante_counter - 1
			if self.config.extra.ante_counter == 0 then -- give blueprint
				self.config.extra.ante_counter = 3
				G.E_MANAGER:add_event(Event({
					func = function()
						local card = SMODS.add_card({
							set = "Joker",
							key = "j_blueprint",
						})
						play_sound("tarot1", 1, 0.5)
						G.deck.cards[1]:juice_up()
						return true
					end,
				}))
			end
		end
	end,
})

SMODS.Back({
	key = "champs_deck",
	loc_txt = {
		name = "Champ's Deck",
		text = {
			"Start with a deck",
			"Of {C:gold,T:m_lucky}Lucky{} cards",
		},
	},
	atlas = "card_backs",
	pos = { x = 6, y = 6 },
	unlocked = true,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				for _, card in ipairs(G.playing_cards) do
					card:set_ability(G.P_CENTERS.m_lucky, true, true)
				end
				return true
			end,
		}))
	end,
})

SMODS.Back({
	key = "abyssal_deck",
	loc_txt = {
		name = "Abyssal Deck",
		text = {
			"Every {C:attention}Joker",
			"in the shop is {C:dark_edition,T:e_negative}Negative{}",
			"{C:red}-1{} hand size every other Ante",
		},
	},
	config = {
		extra = {
			ante_counter = 2,
		},
	},
	atlas = "card_backs",
	pos = { x = 0, y = 2 },
	calculate = function(self, card, context)
		if context.modify_shop_joker then
			G.E_MANAGER:add_event(Event({
				func = function()
					if context.card.ability.set == "Joker" then
						eventify(function()
							context.card:set_edition({ negative = true }, true)
							G.deck.cards[1]:juice_up()
						end)
					end
					return true
				end,
			}))
		end
		if
			context.end_of_round
			and not context.individual
			and not context.repetition
			and context.cardarea == G.hand
			and G.GAME.blind:get_type() == "Boss"
		then -- exactly once, on boss blind end of round
			if card.effect.config.extra.ante_counter ~= 0 then
				card.effect.config.extra.ante_counter = card.effect.config.extra.ante_counter - 1
			else
				card.effect.config.extra.ante_counter = 2
				G.hand:change_size(-1)
				return { message = "-1 Hand Size", message_card = G.deck.cards[1] }
			end
		end
	end,
})
