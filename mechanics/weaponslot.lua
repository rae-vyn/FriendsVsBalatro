local start_run_ref = Game.start_run
function Game:start_run(args)
    self.GAME.starting_params.weapon_slots = 1 -- limiting how many cards can be in this area
    local saveTable = args.savetext or nil

    local selected_back = saveTable and saveTable.BACK.name or (args.challenge and args.challenge.deck and args.challenge.deck.type) or (self.GAME.viewed_back and self.GAME.viewed_back.name) or self.GAME.selected_back and self.GAME.selected_back.name or 'Red Deck'
    selected_back = get_deck_from_name(selected_back)
    self.GAME.selected_back = Back(selected_back)
    -- end base game stuff
    local deck_name = self.GAME.selected_back.name
    local is_fvb = string.find(deck_name, 'b_fvb')
    self.is_fvb = is_fvb
    if not is_fvb then
        start_run_ref(self, args)
        return
    end

    self.weapons = CardArea(0, 0, G.CARD_W * 1.1, G.CARD_H, {
        card_limit = self.GAME.starting_params.weapon_slots,
        type = "joker", -- set this to joker to properly handle use/sell buttons
        highlight_limit = 1
    })
    -- this need to be before the start_run_ref call
    -- or cards in your area won't be loadedmmmmm
    start_run_ref(self, args)


    set_screen_positions()
    G.E_MANAGER:add_event(Event({
        func = function()
            if G.weapons then
                SMODS.add_card({key = "c_fvb_boira"})
            end
            return true
        end,
    }))
    G.consumeables:change_size(5)
end

local set_screen_positions_ref = set_screen_positions
function set_screen_positions()
    set_screen_positions_ref()

    if G.weapons then -- setting the position of the area
        G.weapons.T.x = G.TILE_W - G.weapons.T.w - 0.3
        G.weapons.T.y = 3
        G.weapons:hard_set_VT()
    end
end

local card_highlight_ref = Card.highlight
function Card:highlight(is_higlighted)
    card_highlight_ref(self, is_higlighted)
    -- checking if the card is Cine is my mod stuff, you can do what you want here
    if (self.ability.set == "Weapon") or (self.area and self.area == G.pack_cards) then
        if self.highlighted and self.area and self.area.config.type ~= 'shop' then
            local x_off = (self.ability.consumeable and -0.1 or 0)
            self.children.use_button = UIBox{
                definition = G.UIDEF.use_and_sell_buttons(self),
                config = {align=
                        ((self.area == G.jokers) or (self.area == G.consumeables) or (self.area == G.weapons)) and "cr" or
                        "bmi" -- need to check if the area is yours too, to show use/sell buttons in the right place
                    , offset =
                        ((self.area == G.jokers) or (self.area == G.consumeables) or (self.area == G.weapons)) and {x=x_off - 0.4,y=0} or
                        {x=0,y=0.65}, -- same here
                    parent =self}
            }
        elseif self.children.use_button then
            self.children.use_button:remove()
            self.children.use_button = nil
        end
    end
end


local emplace_ref = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    if self == G.consumeables and card.ability.set == "Weapon" then
        G.weapons:emplace(card, location, stay_flipped)
        return
    end

    emplace_ref(self, card, location, stay_flipped)
end
