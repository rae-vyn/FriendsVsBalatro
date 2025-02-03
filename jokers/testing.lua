return {
    key = "j_fvb_small_head",
    atlas = "placeholder",
    calculate = function(self, card, context)
        if context.blueprint then return end
        if context.selling_self then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.5)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                    local chips_UI = G.hand_text_area.blind_chips
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate()
                    chips_UI:juice_up()
                    card:juice_up()

                    if not silent then play_sound('chips2') end
                    return true
                end
            }))
        end
    end
}