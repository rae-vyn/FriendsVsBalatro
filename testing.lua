return {
    key = "c_fvb_tin_man",
    calculate = function(self, card, context)
		if context.weapon_missed then
			return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            context.other_card:flip()
                            context.other_card:set_ability(G.P_CENTERS.m_steel)
                            return true
                        end
                    }))
                    delay(0.2)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            context.other_card:flip()
                            context.other_card:juice_up()
                            return true
                        end
                    }))
                    delay(0.5)
                end
            }
		end
	end
}
