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
			"{C:purple,E:1,T:eternal}Eternal{} {C:personality}Personality{} card",
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
		name = "Baba Deck",
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
		name = "Siaro Deck",
		text = {
			"Start with a deck",
			"Of {C:green}Poisoned{} cards",
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
		if context.ending_shop and G.GAME.last_blind then
			self.config.extra.ante_counter = self.config.extra.ante_counter - 1
			if self.config.extra.ante_counter == 0 then -- give blueprint
				self.config.extra.ante_counter = 3
				local card = SMODS.add_card({
					set = "Joker",
					key = "j_blueprint",
				})
				play_sound("tarot1", 1, 0.5)
				card:juice_up()
			end
		end
	end,
})
