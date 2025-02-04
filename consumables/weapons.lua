SMODS.Atlas({key = "placeholder", px = 71, py = 95, path = "placeholder.png"})

SMODS.ConsumableType({
    key = 'Weapon',
    primary_colour = HEX("2A2051"),
    secondary_colour = HEX("E0569B"),
    default = 'c_boira',
    loc_txt = {
        name = "Weapon",
        collection = "Weapons",
        undiscovered = {
            name = "Undiscovered Weapon",
            text = {
                "Find this weapon",
                "in a pack to unlock"
            }
        }
    }
})

SMODS.Consumable({
    key = "boira",
    set = "Weapon",
    atlas = 'placeholder',
    loc_txt = {name = "Boira", text = {"Everyone's favorite weapon!"} },
    calculate = function(self, card, context)
        if context.joker_main then
            print("this ran!")
            return {
                chips = 10
            }
        end
    end,
})
