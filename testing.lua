return {
    key = "c_fvb_akimbo",
    use = function(self, card, area, copier)
        G.weapons:change_size(1)
        local _card = copy_card(G.weapons.cards[1], nil)
        G.weapons:emplace(_card)
        G.weapons.cards[2].ability = table.copy(G.weapons.cards[1].ability)
    end,
    keep_on_use = function(self, card)
        return true
    end
}
