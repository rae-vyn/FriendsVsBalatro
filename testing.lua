return {
    key = "c_fvb_energy_drink",
    calculate = function(self, card, context)
		if context.skip_blind then
			G.E_MANAGER:add_event(Event({
				trigger = "immediate",
				func = function ()
					ease_dollars(5)
					card:start_dissolve()
					return true
				end
			}))
		end
	end,
}
