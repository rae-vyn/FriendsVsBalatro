return {
    key = "c_fvb_punchr",
    use = function(self, card, area, copier)
        if area == G.weapons then
            SMODS.add_card({
                key = "c_fvb_boira"
            })
            card:start_dissolve()
            return
        end
        if area == G.pack_cards and #G.weapons.cards > 0 then
            -- print(inspectDepth(G.weapons.cards))
            G.weapons.cards[1]:start_dissolve()
            return
        end
    end,
}
