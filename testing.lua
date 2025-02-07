return {
    key = "c_fvb_medkit",
    use = function(self, card, area, copier)
        if area == G.pack_cards then
            G.consumables:emplace(card)
            return
        end
        print("Hi")
        if card.ability.extra.type == 1 then -- Add chips to cards
            for _, _card in ipairs(G.hand.cards) do
                _card.ability.perma_bonus = (_card.ability.perma_bonus or 0) + card.ability.extra.chips
                _card:juice_up()
            end
        elseif card.ability.extra.type == 2 then -- Add damage to weapons
            for _, weapon in ipairs(G.weapons.cards) do
                weapon.ability.extra.min_damage = weapon.ability.extra.min_damage * card.ability.extra.damage_mult
                weapon.ability.extra.max_damage = weapon.ability.extra.max_damage * card.ability.extra.damage_mult
            end
        end
        card:start_dissolve()
    end
}
