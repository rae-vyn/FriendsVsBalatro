SMODS.Atlas({
    key = "poisoned",
    px = 71,
    py = 95,
    path = "poisoned.png"
})
SMODS.Seal({
    key = "poison",
    loc_txt = {
        name = "Poison",
        label = "Poison Seal",
        text = {
            "{C:green}1 in 2{} chance", "for {C:white,X:mult}X2{} Mult",
            "{C:green}1 in 10{} chance", "for {C:white,X:mult}X0.5{} Mult"
        }
    },
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
