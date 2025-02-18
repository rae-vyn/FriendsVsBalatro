SMODS.Atlas({
    key = "friends_back",
    px = 71,
    py = 95,
    path = "friends_back.png"
})

SMODS.Atlas({
    key = "baba_back",
    px = 71,
    py = 95,
    path = "card_back_baba.png"
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
    unlocked = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                local card = SMODS.add_card({
                    set = "Joker",
                    rarity = "fvb_personality",
                    stickers = { 'eternal' }
                })
                check_for_unlock({fvb_char = card.config.center_key})
                return true
            end
        }))
    end
})

SMODS.Back({
    key = "baba_deck",
    atlas = "baba_back",
    loc_txt = {
        name = "Baba Deck",
        text = {
            "Start with a deck",
            "Of {C:attention}Gold{} {C:mult}Hearts"
        }
    },
    unlocked = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    SMODS.change_base(card, "Hearts")
                    card:set_ability(G.P_CENTERS.m_gold)
                end
                return true
            end
        }))
    end
})

SMODS.Back({
    key = "siaro_deck",
    loc_txt = {
        name = "Siaro Deck",
        text = {
            "Start with a deck",
            "Of {C:green}Poisoned{} cards"
        }
    },
    unlocked = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    card:set_seal('fvb_poison', true, true)
                end
                return true
            end
        }))
    end
})
