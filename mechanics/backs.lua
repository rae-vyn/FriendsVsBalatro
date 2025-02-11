SMODS.Back({
    key = "friends_deck",
    loc_txt = {
        name = "Friends Deck",
        text = {
            "Start with a random",
            "{C:purple,E:1,T:eternal}Eternal{} {C:personality}Personality{} card"
        }
    },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.add_card({
                    set = "Joker",
                    rarity = "fvb_personality",
                    stickers = { 'eternal' }
                })
                return true
            end
        }))
    end
})