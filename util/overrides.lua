local init_item_prototypes_ref = Game.init_item_prototypes
function Game:init_item_prototypes()
	init_item_prototypes_ref(self)

	G.C.SECONDARY_SET.Weapon = HEX("E0569B")
	G.C.SECONDARY_SET.Personality = HEX("E7680D")
end

function table.copy(t)
	local t2 = {}
	for k, v in pairs(t) do
		if type(v) == "table" then
			t2[k] = table.copy(v)
		else
			t2[k] = v
		end
	end
	return t2
end

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    loc_colour_ref(_c, _default) -- toss the return value, we don't need it
    G.ARGS.LOC_COLOURS['weapon'] = HEX("E0569B")
    G.ARGS.LOC_COLOURS['personality'] = HEX("E7680D")
    return G.ARGS.LOC_COLOURS[_c] or _default or G.C.UI.TEXT_DARK -- recalculate result
end
