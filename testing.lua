return {
    key = "b_fvb_fossil_deck",
    calculate = function(self, card, context) 
		if context.weapon_hit and 
			SMODS.has_enhancement(context.other_card, 'm_stone') then
				eventify(function() context.other_card:flip() delay(0.5) end)
				eventify(function() context.other_card:set_ability(G.P_CENTERS.c_base) end)
				eventify(function() delay(0.75) context.other_card:flip() end)
		end
	end,
}
