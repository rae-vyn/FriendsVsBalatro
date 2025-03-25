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

SMODS.Shader({
    key = 'fire',
    path = "fire.fs"
})

SMODS.Edition({
    key = "fire",
    shader = "fire",
    disable_base_shader = true,
    config = {
        extra = {
            odds = 2,
            x_mult = 3,
        }
    },
    loc_vars = function(self, info_queue, card) 
        return { vars = {(G.GAME.probabilities.normal or 1), self.config.extra.odds, self.config.extra.x_mult}}
    end,
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {x_mult = self.config.extra.x_mult}
        end
        if context.destroying_card then
            if pseudorandom('fire') < G.GAME.probabilities.normal / self.config.extra.odds then
                return {remove = true}
            end
        end
    end
})