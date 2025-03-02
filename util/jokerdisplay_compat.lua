local jd = JokerDisplay.Definitions

jd["j_fvb_donnie_b"] = {
	text = {
		{ text = "+", colour = G.C.CHIPS },
		{ ref_table = "card.ability.extra", ref_value = "chips", colour = G.C.CHIPS },
	},
}

jd["j_fvb_moose_salto"] = {
	text = {
		{
			border_nodes = {
				{ text = "X" },
				{ ref_table = "card.joker_display_values", ref_value = "xmult" },
			},
		},
	},
	calc_function = function(card)
		card.joker_display_values.xmult = 2 ^ card.ability.extra.pow
	end,
}

jd["j_fvb_haru"] = {
	text = {
		{
			border_nodes = {
				{ text = "X" },
				{ ref_table = "card.ability.extra", ref_value = "xmult" },
			},
		},
	},
	reminder_text = {
		{
			text = "(Gains ",
		},
		{
			border_nodes = {
				{ text = "X", colour = G.C.WHITE},
				{ ref_table = "card.ability.extra", ref_value = "xmult_gain", colour = G.C.WHITE },
			},
		},
		{
			text = ")",
		},
	},
}

jd["j_fvb_little_lars"] = {
	text = {
		{ ref_table = "card.joker_display_values", ref_value = "reduction", colour = G.C.MONEY },
	},
	calc_function = function(card)
		card.joker_display_values.reduction = 100 - card.ability.extra.blind_reduction * 100 .. "%"
	end,
}

jd["j_fvb_dooper"] = {
	text = {
		{
			{ text = "Currently" },
			border_nodes = {
				{ ref_table = "card.joker_display_values", ref_value = "multype" },
				{ ref_table = "card.ability.extra", ref_value = "mult" },
			},
		},
	},
	calc_function = function(card)
		if G.GAME and G.GAME.current_round.hands_left <= 1 then
			card.joker_display_values.multype = "X"
		else
			card.joker_display_values.multype = "+"
		end
	end,
}
