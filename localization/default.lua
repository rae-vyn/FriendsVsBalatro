return {
    descriptions = {
        Mod = {
            FriendsVsBalatro = {
                name = "Friends Vs. Balatro",
                text = {
                    "Adds {C:personality}Friends Vs Friends{} mechanics to Balatro."
                }
            }
        },
        HotCard = {
            c_fvb_green_herb = {
                name = "Green Herb",
                text = {"Gives {C:blue}+20{} Chips", "to each card in hand"}
            },
            c_fvb_dither = {
                name = "Dither",
                text = {"Gives {C:blue}+20{} Chips", "to each card in hand"}
            },
            c_fvb_banding = {
                name = "Banding",
                text = {"{C:green}#1# in #2#{} chance", "to turns each card in hand", "into a {C:mult}Mult{} Card"}
            },
        },
        Joker = {
            j_fvb_donnie_b = {
                name = "Donnie B",
                text = {
                    "Gains {C:chips}+#2#{} Chips",
                    "per {C:attention}Queen{} scored",
                    "(Currently {C:chips}+#1#{})"
                }
            },
            j_fvb_stevie_gull = {
                name = "Stevie Gull",
                text = {
                    "Reloads {C:weapon}Golden Boira{},",
                    "{C:mult}+#1#{} damage", "on round start"
                }
            },
            j_fvb_spike_remington = {
                name = "Spike Remington",
                text = {
                    "Currently held {C:weapon}Weapon",
                    "gains {C:mult}+#1#{} Damage",
                    "per {C:attention}Ace{} played"
                }
            },
            j_fvb_sable_santana = {
                name = "Sable Santana",
                text = {
                    "Reloads {C:weapon}Katana{},",
                    "{C:white,X:mult}X#1#{} damage", "on round start"
                }
            },
            j_fvb_duck_anderson = {
                name = "Duck Anderson",
                text = {
                    "Gives a {C:buff}Green Herb",
                    "card at the beginning of round"
                }
            },
            j_fvb_dj_newton = {
                name = "DJ Newton",
                text = {
                    "{C:green}Miss Chance{}", "reduced by {C:green}#1#%",
                    "every round"
                }
            },
            j_fvb_moose_salto = {
                name = "Moose Salto",
                text = {
                    "Every {C:attention}2{} blinds",
                    "skipped sets {C:white,X:mult}XMult{}", "to the next",
                    "{C:mult}power of 2",
                    "(Currently {C:white,X:mult}X2 ^ #1#{})"
                }
            },
            j_fvb_myk_raver = {
                name = "Myk Raver",
                text = {
                    "{C:attention}Doubles", "the {C:weapon}Brasshopper's",
                    "max ammo every round"
                }
            },
            j_fvb_little_lars = {
                name = "Little Lars",
                text = {
                    "Reduces {C:attention}Blind size",
                    "by {C:mult}#1#%{}, increases",
                    "{C:mult}#2#%{} after {C:attention}Boss Blind"
                }
            },
            j_fvb_haru = {
                name = "Haru",
                text = {
                    "Gains {C:white,X:mult}X#2#{} Mult",
                    "when {C:attention}Blind{} started",
                    "Gain amount resets if", "a Blind is {C:mult}skipped",
                    "(Currently {C:white,X:mult}X#1#{})"
                }
            },
            j_fvb_klustr = {
                name = "Klustr Jr.",
                text = {
                    "Gives {C:personality,E:1}Dither and Banding",
                    "on round start", "(Must have room)"
                }
            },
            j_fvb_ribberto = {
                name = "Ribberto Mulligan",
                text = {
                    "When a {C:attention}Straight Flush", "is played, create",
                    "a random {C:personality,E:1}Personality{} card",
                    "(Must have room)"
                }
            },
            j_fvb_margarita = {
                name = "Margarita Kala",
                text = {
                    "Playing a {C:attention}Flush",
                    "triggers an {C:weapon}effect"
                }
            },
            j_fvb_dale = {
                name = "Dale Donovan",
                text = {
                    "Retrigger {C:attention}last{} scored card",
                    "gains {C:white,X:mult}X0.5{} Mult if",
                    "that card is an {C:attention}Ace",
                    "(Currently {C:white,X:mult}X#1#{})"
                }
            },
            j_fvb_dingo = {
                name = "FKF_Dingo",
                text = {
                    "{C:mult}Destroy{} every discarded card,",
                    "gains {C:white,X:mult}X#2#{} per card",
                    "(Currently: {C:white,X:mult}X#1#{})"
                }
            },
            j_fvb_siaro = {
                name = "Siaro",
                text = {
                    "Every played card gains the", "{C:green}Poisoned{} seal"
                }
            },
            j_fvb_jawhara = {
                name = "Jawhara Farms",
                text = {
                    "Gains {C:white,X:mult}X#2#{} Mult",
                    "per shot {C:mult}missed{}",
                    "(Currently: {C:white,X:mult}X#1#{})"
                }
            },
            j_fvb_laika = {
                name = "Laika",
                text = {
                    "{C:weapon}Laika{} always has two bullets",
                    "Gains {C:white,X:mult}X#2#{} Mult per shot {C:mult}hit{}",
                    "(Currently: {C:white,X:mult}X#1#{})"
                }
            },
            j_fvb_dooper = {
                name = "Dooper",
                text = {
                    "Gains {C:mult}+#2#{} Mult", "per {C:red}Heart{} played,",
                    "Turns into {C:white,X:mult}XMult{}", "on the last hand",
                    "(Currently: {C:white,X:mult}+/X#1#{})"
                }
            },
            j_fvb_ktqtpi = {
                name = "KTQTPI",
                text = {
                    "Each card played", "gains {C:chips}#1#{} Chips",
                    "per card in hand"
                }
            },
            j_fvb_bach = {
                name = "Bach Roadstein",
                text = {
                    "Automatically {C:attetion}win blind",
                    "if hand is played with", "{C:attention}#1#%{} of the",
                    "required chips scored"
                }
            }
        },
        Buff = {
            c_fvb_medkit = {
                name = "Medkit",
                text = {"Add {C:blue}+50{} Chips", "to every card in hand"}
            },
            c_fvb_small_head = {
                name = "Small Head",
                text = {"Reduce {C:attention}Blind{} size", "by {C:mult}50%{}"}
            },
            c_fvb_steel_bullets = {
                name = "Steel Bullets",
                text = {
                    "Increase {C:weapon}Weapon's",
                    "{C:mult}damage{} by {C:white,X:mult}50%{}"
                }
            },
            c_fvb_big_mag = {
                name = "Big Mag",
                text = {
                    "Increase {C:weapon}Weapon's",
                    "{C:inactive}ammo{} by {C:green}50%{}"
                }
            },
            c_fvb_akimbo = {
                name = "Akimbo",
                text = {
                    "Duplicate the {C:weapon}Weapon", "you currently have",
                    "{C:inactive}(Doesn't stack)"
                }
            },
            c_fvb_health_up = {
                name = "Health Up",
                text = {
                    "Adds {C:blue}+10{} Chips", "per card in hand",
                    "to each card"
                }
            },
            c_fvb_move_faster = {
                name = "Move Faster",
                text = {"Reduces Blind size", "by {C:attention}10%"}
            },
            c_fvb_double_jump = {
                name = "Double Jump",
                text = {
                    "{C:attention}Sets scored chips to blind size",
                    "{C:mult}-2{} hand size"
                }
            },
            c_fvb_more_accuracy = {
                name = "More Accuracy",
                text = {
                    "Gives held {C:weapon}Weapon(s)",
                    "{C:green}-10%{} miss chance"
                }
            },
            c_fvb_quick_reload = {
                name = "Quick Reload",
                text = {
                    "Gives held {C:weapon}Weapon(s)",
                    "{C:attention}-1{} reload time", "{C:inactive}(Down to 1)"
                }
            },
            c_fvb_vampire_bullets = {
                name = "Vampire Bullets",
                text = {
                    "Every {C:weapon}shot hit",
                    "removes {C:blue}100{} from the blind size",
                    "while this card is held"
                }
            },
            c_fvb_extra_cards = {
                name = "Extra Cards",
                text = {"Draw {C:attention}3 cards", "from your deck"}
            },
            c_fvb_energy_drink = {
                name = "Energy Drink",
                text = {
                    "Skipping a blind",
                    "gives {C:money}$5{}, {C:red}self destructs"
                }
            },
            c_fvb_helmet = {
                name = "Helmet",
                text = {"Reduce Blind size", "by {C:blue}-1000"}
            },
            c_fvb_poison_bullets = {
                name = "Poison Bullets",
                text = {
                    "Every card {C:weapon}hit",
                    "gains a {C:green,T:s_fvb_poison}Posion{} seal",
                    "while this is held"
                }
            },
            c_fvb_tin_man = {
                name = "Tin Man",
                text = {
                    "Every card {C:weapon}missed",
                    "turns into a {C:attention}Steel{} card",
                    "while this is held"
                }
            },
            c_fvb_card_profaner = {
                name = "Card Profaner",
                text = {
                    "Draw the last 3 cards",
                    "from the {C:attention}discard pile"
                }
            },
            c_fvb_card_thief = {
                name = "Card Thief",
                text = {"Create a random", "{C:buff}Buff{} card"}
            }
        },
        Debuff = {
            c_fvb_big_head = {
                name = "Big Head",
                text = {
                    "{C:attention}X1.25{} Blind size",
                    "After {C:mult}#1#{} rounds gain {C:money}$20{}",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_health_down = {
                name = "Health Down",
                text = {
                    "Removes {C:chips}-1{} Chip from each card",
                    "After {C:mult}#1#{} rounds gain {C:chips}+1{} hand",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_move_slower = {
                name = "Move Slower",
                text = {
                    "{C:attention}+200{} to blind size",
                    "After {C:mult}#1#{} rounds gain a {C:buff}Buff{} card",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_no_jump = {
                name = "No Jump",
                text = {
                    "Beat blinds in {C:mult}one hand{} or lose",
                    "After {C:mult}#1#{} rounds gain {C:mult}+2{} hand size",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_less_accuracy = {
                name = "Less Accuracy",
                text = {
                    "{C:mult}+10%{} miss chance every round",
                    "After {C:mult}#1#{} rounds set miss chance to {C:green}25%{}",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_rubber_bullets = {
                name = "Rubber Bullets",
                text = {
                    "{C:mult}-5{} damage every round",
                    "After {C:mult}#1#{} rounds set damage to {C:mult}30-50{}",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_small_mag = {
                name = "Small Mag",
                text = {
                    "{C:mult}75%{} max ammo amount",
                    "After {C:mult}#1#{} rounds set ammo max to {C:red}30{}",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_slow_reload = {
                name = "Slow Reload",
                text = {
                    "{C:mult}+1{} reload time",
                    "After {C:mult}#1#{} rounds set reload time to {C:blue}2{}",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_invisible_hand = {
                name = "Invisible Hand",
                text = {
                    "{C:green}3 in 4{} cards in hand get flipped",
                    "After {C:mult}#1#{} rounds give {C:money}$30{}",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_disarm = {
                name = "Disarm",
                text = {
                    "Replaces weapon(s) with a {C:weapon}Boira",
                    "Creates a {C:spectral}Spectral{} card",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_poison = {
                name = "Poison",
                text = {
                    "Each card played gives {C:white,X:mult}X0.5{} Mult",
                    "After {C:mult}#1#{} rounds make a",
                    "random Joker {C:dark_edition}Negative{}",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_swap_weapon = {
                name = "Swap Weapon",
                text = {
                    "Replaces weapon(s) with a", "random weak {C:weapon}Weapon",
                    "Creates a {C:tarot}Hermit{} card",
                    "{C:inactive}(Self destructs after)"
                }
            },
            c_fvb_empty_mag = {
                name = "Empty Mag",
                text = {
                    "Sets {C:weapon}Weapon{} ammo to {C:mult}0",
                    "Gives {C:money}$2{} per bullet removed",
                    "{C:inactive}(Self destructs after)"
                }
            }

        },
        Back = {
            b_fvb_friends_deck = {
                name = "Friends Deck",
                text = {
                    "Start with a random",
                    "{C:purple,E:1,T:m_eternal}Eternal{} {C:personality}Personality{} card"
                }
            },
            b_fvb_baba_deck = {
                name = "Baba's Deck",
                text = {
                    "Start with a deck", "Of {C:attention}Gold{} {C:mult}Hearts"
                }
            },
            b_fvb_siaro_deck = {
                name = "Siaro's Deck",
                text = {
                    "Start with a deck",
                    "Of {C:green, T:fvb_poison_seal}Poison Seal{} cards"
                }
            },
            b_fvb_schema_deck = {
                name = "Schema Deck",
                text = {
                    "Get a free {C:blue,T:j_blueprint}Blueprint",
                    "every three {C:attention}Antes"
                }
            },
            b_fvb_champs_deck = {
                name = "Champ's Deck",
                text = {
                    "Start with a deck", "Of {C:gold,T:m_lucky}Lucky{} cards"
                }
            },
            b_fvb_abyssal_deck = {
                name = "Abyssal Deck",
                text = {
                    "Every {C:attention}Joker",
                    "in the shop is {C:dark_edition,T:e_negative}Negative{}",
                    "{C:red}-1{} hand size every other Ante"
                }
            },
            b_fvb_fossil_deck = {
                name = "Fossil Deck",
                text = {
                    "Start with a deck",
                    "of {C:inactive,T:m_stone}Stone{} cards;",
                    "Each {C:mult}hit{} removes",
                    "the {C:inactive,T:m_stone}Stone{}",
                    "{C:green}#1# in #2#{} chance to {C:mult}destroy{} card"
                }
            }
        },
        Edition = {
            e_fvb_poison_ed = {
                name = "Poison",
                text = {
                    "{C:green}#1# in #2#{} chance", "for {C:white,X:mult}X2{} Mult",
                    "{C:green}#1# in #3#{} chance",
                    "for {C:white,X:mult}X0.5{} Mult"
                }
            },
        },
        Other = {
            p_fvb_basic_pack = {
                name = "Basic Pack",
                text = {"Contains 5", "Friends Vs. Friends cards"}
            },
            p_fvb_gold_pack = {
                name = "Gold Pack",
                text = {
                    "Contains 5", "Friends Vs. Friends cards",
                    "One is a {C:attention}Polychrome{} {C:weapon}Weapon"
                }

            },
            fvb_poison_seal = {
                name = "Poison",
                text = {
                    "{C:green}#1# in #2#{} chance", "for {C:white,X:mult}X2{} Mult",
                    "{C:green}#1# in #3#{} chance",
                    "for {C:white,X:mult}X0.5{} Mult"
                }
            },
            undiscovered_buff = {
                name = "Undiscovered Buff",
                text = {"Find this buff", "in a pack to unlock"}
            },
            undiscovered_debuff = {
                name = "Undiscovered Debuff",
                text = {"Find this debuff", "in a pack to unlock"}
            },
            undiscovered_weapon = {
                name = "Undiscovered Weapon",
                text = {"Find this weapon", "in a pack to unlock"}
            },
            undiscovered_hotcard = {
                name = "Undiscovered Hot Card",
                text = {"Generate this Hot Card to unlock"}
            }
        },
        Weapon = {
            c_fvb_boira = {
                name = "Boira 9",
                text = {
                    "The Classic", "{C:mult}+#1#-#2#{} Mult",
                    "{C:green}#3#%{} chance to miss",
                    "{C:blue}#5#{} hand reload time", "{C:inactive}(Ammo: #4#)"
                }
            },
            c_fvb_boomstick = {
                name = "Boomstick",
                text = {
                    "Close-range clutch!", "{C:mult}+#1#-#2#{} Mult",
                    "{C:green}#3#%{} chance to miss",
                    "{C:blue}#5#{} hand reload time", "{C:inactive}(Ammo: #4#)"
                }
            },
            c_fvb_albatross = {
                name = "Albatross 21",
                text = {
                    "Newton says hello!", "{C:mult}+#1#-#2#{} Mult",
                    "{C:green}#3#%{} chance to miss",
                    "{C:blue}#5#{} hand reload time", "{C:inactive}(Ammo: #4#)"
                }
            },
            c_fvb_brasshopper = {
                name = "Brasshopper",
                text = {
                    "A bit of the Raver flavour.", "{C:mult}+#1#-#2#{} Mult",
                    "{C:green}#3#%{} chance to miss",
                    "{C:blue}#5#{} hand reload time", "{C:inactive}(Ammo: #4#)"
                }
            },
            c_fvb_laika = {
                name = "Laika",
                text = {
                    "You had it coming.", "{C:mult}+#1#-#2#{} Mult",
                    "{C:green}#3#%{} chance to miss",
                    "{C:blue}#5#{} hand reload time", "{C:inactive}(Ammo: #4#)"
                }
            },
            c_fvb_fk = {
                name = "FK-82",
                text = {
                    "Friends of high caliber.", "{C:mult}+#1#-#2#{} Mult",
                    "{C:green}#3#%{} chance to miss",
                    "{C:blue}#5#{} hand reload time", "{C:inactive}(Ammo: #4#)"
                }
            },
            c_fvb_gld_boira = {
                name = "Golden Boira",
                text = {
                    "The gold standard.", "{C:mult}+#1#-#2#{} Mult",
                    "{C:green}#3#%{} chance to miss",
                    "{C:blue}#5#{} hand reload time", "{C:inactive}(Ammo: #4#)"
                }
            },
            c_fvb_punchr = {
                name = "Punch-R",
                text = {
                    "Lars' specialty.", "{C:mult}+#1#-#2#{} Mult",
                    "{C:green}#3#%{} chance to miss",
                    "{C:blue}#5#{} hand reload time", "{C:inactive}(Ammo: #4#)"
                }
            },
            c_fvb_katana = {
                name = "Katana",
                text = {
                    "A gift from Sable.", "{C:mult}+#1#-#2#{} Mult",
                    "{C:green}#3#%{} chance to miss",
                    "{C:blue}#5#{} hand reload time", "{C:inactive}(Ammo: #4#)"
                }
            }
        }
    },
    misc = {
        challenge_names = {
            c_fvb_the_trio = "The Trio"
        },
        v_text = {
            ch_c_onlyqueens = {
                "All face cards in deck are {C:attention}Queens{}"
            }
        },
        dictionary = {
            b_buff_cards = "Buffs",
            b_debuff_cards = "Debuffs",
            b_weapon_cards = "Weapons",
            b_hotcard_cards = "Hot Cards",
            k_fvb_again = "Again!",
            k_fvb_accel = "Accelerating",
            k_fvb_upgraded = "Upgraded!",
            k_fvb_buffed = "Buffed!",
            k_fvb_reduced = "Reduced!",
            k_fvb_reset = "Reset!",
            k_fvb_won = "Won!",
            k_fvb_gains = "Gains",
            k_fvb_hit = "Hit!",
            k_fvb_missed = "Missed!",
            k_fvb_reloading = "Reloading...",
            k_fvb_reloaded = "Reloaded!",
            k_fvb_currently = "Currently",
            k_fvb_until_reload = " hand(s) until reload",
            k_buff = "Buff",
            k_debuff = "Debuff",
            k_weapon = "Weapon",
            k_hotcard = "Hot Card",
            k_personality = "Personality",

        },
        labels = {
            fvb_poison_seal = "Poison Seal",
            fvb_poison_ed = "Poison"
        }
    }
}
