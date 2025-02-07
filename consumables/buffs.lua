SMODS.Atlas({key = "placeholder", px = 71, py = 95, path = "placeholder.png"})

--[[
    Buff Types:
    - Health (+chips): 1
    - Damage (+mult): 2
    - Get Cards: 3
    - Expose enemy: 4
    - Minimize damage: 5
    - Evasion: 6
]]

SMODS.ConsumableType({
    key = 'Buff',
    primary_colour = HEX("2A2051"),
    secondary_colour = HEX("E0569B"),
    default = 'c_fvb_small_head',
    loc_txt = {
        name = "Buff",
        collection = "Buffs",
        undiscovered = {
            name = "Undiscovered Buff",
            text = {
                "Find this buff",
                "in a pack to unlock"
            }
        }
    },
})

function use_buff(self, card, area, copier)
    if card.ability.extra.type == 1 then -- Add chips to cards
        for _, _card in ipairs(#G.hand) do
        end
    end
end

function can_use_buff(self, card)
    if card.ability.extra.type < 3 then
        return card.area == G.consumables 
    end
end