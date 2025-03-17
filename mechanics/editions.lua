SMODS.Edition({
    key = "poison_ed",
    shader = "poison",
    config = {
        extra = {
            odds = 2,
            other_odds = 10,
            x_mult = 200,
        }
    },
    loc_vars = function(self, info_queue, card) 
        return { vars = {(G.GAME.probabilities.normal or 1), self.config.extra.odds, self.config.extra.other_odds}}
    end,
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local pseudoval = pseudorandom('poison')
            if pseudoval < G.GAME.probabilities.normal / self.config.extra.odds then
                return {x_mult = 2}
            elseif pseudoval < G.GAME.probabilities.normal / self.config.extra.other_odds then
                return {x_mult = 0.5}
            end
        end
    end
})

SMODS.Shader({
    key = 'poison',
    path = "poison.fs"
})