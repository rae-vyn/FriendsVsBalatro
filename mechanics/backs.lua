SMODS.Atlas({
    key = "friends_back",
    px = 71,
    py = 95,
    path = "friends_back.png"
})

SMODS.Back({
    key = "friends_deck",
    atlas = "friends_back",
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