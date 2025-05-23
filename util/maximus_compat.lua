if G.mxms_horoscope then
    G.mxms_horoscope.T.w = G.mxms_horoscope_W * 0.5
    G.mxms_horoscope.T.h = G.mxms_horoscope_H * 0.5
end

local emplace_ref = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    if self == G.consumeables and card.ability.set == "Horoscope" then
        G.mxms_horoscope:emplace(card, location, stay_flipped)
        card.T.w = card.T.w * 0.5
        card.T.h = card.T.h * 0.5
        return
    end

    emplace_ref(self, card, location, stay_flipped)
end

local set_screen_positions_ref = set_screen_positions
function set_screen_positions()
    set_screen_positions_ref()
    if G.mxms_horoscope then
        G.mxms_horoscope.T.x = G.TILE_W - G.mxms_horoscope.T.w - 1.4
        G.mxms_horoscope.T.y = 6
        G.mxms_horoscope:hard_set_VT()
        return
    end
end
