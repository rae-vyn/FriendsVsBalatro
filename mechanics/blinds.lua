SMODS.Blind({
    key = "the_jam",
    atlas = "the_jam",
    boss = { min = 2 },
    boss_colour = HEX("E0569B"),
    recalc_debuff = function (self, card, from_blind)
        if (card.area == G.weapons) and not G.GAME.blind.disabled then
			return true
		end
    end,
})