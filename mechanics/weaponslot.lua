local start_run_ref = Game.start_run
function Game:start_run(args)
    self.GAME.starting_params.weapon_slots = 1 -- limiting how many cards can be in this area
    self.GAME.starting_params.debuff_slots = 1
    self.is_fvb = true
    self.GAME.FVB = {
        buff_in_store = false,
        debuff_in_store = false,
        personalities_in_store = false
    }

    self.weapons = CardArea(0, 0, G.CARD_W * 1.1, G.CARD_H, {
        card_limit = self.GAME.starting_params.weapon_slots,
        type = "joker", -- set this to joker to properly handle use/sell buttons
        highlight_limit = 1,
        view_deck = true
    })

    self.debuffs = CardArea(0, 0, G.CARD_W * 0.5, G.CARD_H * 0.5, {
        card_limit = self.GAME.starting_params.debuff_slots,
        type = "joker", -- set this to joker to properly handle use/sell buttons
        highlight_limit = 1,
        view_deck = true
    })
    -- this need to be before the start_run_ref call
    -- or cards in your area won't be loaded
    start_run_ref(self, args)


    set_screen_positions()
    G.E_MANAGER:add_event(Event({
        func = function()
            if G.weapons and #G.weapons.cards == 0 then
                SMODS.add_card({key = "c_fvb_boira"})
            end
            return true
        end,
    }))

    G.E_MANAGER:add_event(Event({
        func = function()
            if #G.debuffs.cards > 0 then
                G.debuffs.cards[1].T.w = G.debuffs.cards[1].T.w * 0.5
                G.debuffs.cards[1].T.h = G.debuffs.cards[1].T.h * 0.5
            end
            return true
        end,
    }))
    if G.consumeables.config.card_limit == 2 then
        G.consumeables:change_size(5)
    end
end

local set_screen_positions_ref = set_screen_positions
function set_screen_positions()
    set_screen_positions_ref()

    if G.weapons then -- setting the position of the area
        G.weapons.T.x = G.TILE_W - G.weapons.T.w - 0.3
        G.weapons.T.y = 3
        G.weapons:hard_set_VT()
    end
    if G.debuffs then
        G.debuffs.T.x = G.TILE_W - G.debuffs.T.w - 0.3
        G.debuffs.T.y = 6
        G.debuffs:hard_set_VT()
    end
end

local card_highlight_ref = Card.highlight
function Card:highlight(is_higlighted)
    card_highlight_ref(self, is_higlighted)
    -- checking if the card is Cine is my mod stuff, you can do what you want here
    if (self.ability.set == "Weapon") then
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
        end
        if self.children.use_button and not (self.area and self.area == G.pack_cards) then
            self.children.use_button:remove()
            self.children.use_button = nil
        end
    end
    if (self.ability.set == "Debuff") then
        if self.highlighted and self.area and self.area.config.type ~= 'shop' then
            local x_off = (self.ability.consumeable and -0.1 or 0)
            self.children.use_button = UIBox{
                definition = G.UIDEF.use_and_sell_buttons(self),
                config = {align=
                        ((self.area == G.jokers) or (self.area == G.consumeables) or (self.area == G.weapons)) and "cr" or
                        "bmi" -- need to check if the area is yours too, to show use/sell buttons in the right place
                    , offset =
                        ((self.area == G.jokers) or (self.area == G.consumeables) or (self.area == G.weapons)) and {x=x_off - 0.4,y=0} or
                        {x=0,y=0.65}, -- same heres
                    parent =self}
            }
        end
        if self.children.use_button and not (self.area and self.area == G.pack_cards) then
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
    if self == G.consumeables and card.ability.set == "Debuff" then
        G.debuffs:emplace(card, location, stay_flipped)
        card.T.w = card.T.w * 0.5
        card.T.h = card.T.h * 0.5
        return
    end


    emplace_ref(self, card, location, stay_flipped)
end
