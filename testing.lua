return {
    key = "b_fvb_schema_deck",
    calculate = function (self, back, context)
        if context.ending_shop then
            self.config.extra.ante_counter = self.config.extra.ante_counter - 1
            if self.config.extra.ante_counter == 0 then -- give blueprint
                self.config.extra.ante_counter = 3
                local card = SMODS.add_card({
                    set = "Joker",
                    key = "j_blueprint"
                })
                play_sound("tarot1", 1, 0.5)
                card:juice_up()
            end
        end
    end
}
