return {
    key = "c_fvb_boira",
    atlas = "placeholder",
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not card.ability.extra.reloading then
			local chosen_mult = 13 + pseudorandom_element({ 0, 1, 2, 3, 4, 5, 6 }, pseudoseed("boira"))
            card.ability.extra.curr_ammo = card.ability.extra.curr_ammo - 1
            if card.ability.extra.curr_ammo <= 0 then
                card.ability.extra.reloading = true
            end
            if pseudorandom('boira') < card.ability.extra.miss_chance/100 then
                return {
                    message = "Missed!"
                }
            end
            sendDebugMessage("Ammo left: " .. card.ability.extra.curr_ammo)
			return {
				mult = chosen_mult,
				card = card,
			}
		elseif card.ability.extra.reloading and context.after then
            sendDebugMessage("Until Reload: " .. card.ability.extra.reload_countdown)
            if card.ability.extra.reload_countdown > 0 then
                card.ability.extra.reload_countdown = card.ability.extra.reload_countdown - 1
                return {
                    message = "Reloading..."
                }
            end
            card.ability.extra.reloading = false
            card.ability.extra.curr_ammo = card.ability.extra.max_ammo
            card.ability.extra.reload_countdown = 3
            return {
                message = "Reloaded!"
            }
        end
	end,
}