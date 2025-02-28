SMODS.Challenge({
    key = "the_trio",
    loc_txt = {name = "The Trio"},
    rules = {
        modifiers = {
            {id = 'joker_slots', value = 3},
            {id = 'consumable_slots', value = 7}
        },
        custom = {{id = "onlyqueens"}, {id = "no_shop_jokers"}}
    },
    jokers = {
        {id = "j_fvb_haru", eternal = true},
        {id = "j_fvb_donnie_b", eternal = true},
        {id = "j_fvb_moose_salto", eternal = true}
    },
    restrictions = {
        banned_other = {{id = "bl_final_leaf", type = "blind"}},
        banned_cards = {
            {id = "p_buffoon_normal_1"}, {id = "p_buffoon_normal_2"},
            {id = "p_buffoon_jumbo_1"}, {id = "p_buffoon_mega_1"}
        },
        banned_tags = {
            {id = "tag_uncommon"}, {id = "tag_rare"}, {id = "tag_negative"},
            {id = "tag_foil"}, {id = "tag_holo"}, {id = "tag_polychrome"},
            {id = "tag_top_up"}, {id = "tag_buffoon"}
        }
    },
    deck = {
        type = "Challenge Deck",
        cards = {
            {s = "D", r = "2"}, {s = "D", r = "3"}, {s = "D", r = "4"},
            {s = "D", r = "5"}, {s = "D", r = "6"}, {s = "D", r = "7"},
            {s = "D", r = "8"}, {s = "D", r = "9"}, {s = "D", r = "T"},
            {s = "D", r = "Q"}, {s = "D", r = "Q"}, {s = "D", r = "Q"},
            {s = "D", r = "A"}, {s = "C", r = "2"}, {s = "C", r = "3"},
            {s = "C", r = "4"}, {s = "C", r = "5"}, {s = "C", r = "6"},
            {s = "C", r = "7"}, {s = "C", r = "8"}, {s = "C", r = "9"},
            {s = "C", r = "T"}, {s = "C", r = "Q"}, {s = "C", r = "Q"},
            {s = "C", r = "Q"}, {s = "C", r = "A"}, {s = "H", r = "2"},
            {s = "H", r = "3"}, {s = "H", r = "4"}, {s = "H", r = "5"},
            {s = "H", r = "6"}, {s = "H", r = "7"}, {s = "H", r = "8"},
            {s = "H", r = "9"}, {s = "H", r = "T"}, {s = "H", r = "Q"},
            {s = "H", r = "Q"}, {s = "H", r = "Q"}, {s = "H", r = "A"},
            {s = "S", r = "2"}, {s = "S", r = "3"}, {s = "S", r = "4"},
            {s = "S", r = "5"}, {s = "S", r = "6"}, {s = "S", r = "7"},
            {s = "S", r = "8"}, {s = "S", r = "9"}, {s = "S", r = "T"},
            {s = "S", r = "Q"}, {s = "S", r = "Q"}, {s = "S", r = "Q"},
            {s = "S", r = "A"}
        }
    }
})
