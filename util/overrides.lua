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
