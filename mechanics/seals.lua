
SMODS.Seal({
    key = "poison",
    atlas = "poisoned",
    badge_colour = HEX('4F6552'),
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local pseudoval = pseudorandom('poison')
            if pseudoval < 0.1 then
                return {xmult = 2}
            elseif pseudoval < 0.5 then
                return {xmult = 0.5}
            end
        end
    end
})
