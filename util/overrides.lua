local init_item_prototypes_ref = Game.init_item_prototypes
function Game:init_item_prototypes()
	init_item_prototypes_ref(self)

	G.C.SECONDARY_SET.Weapon = HEX("E0569B")
	G.C.SECONDARY_SET.Personality = HEX("E7680D")
	G.C.SECONDARY_SET.Buff = HEX("009B84")
	G.C.SECONDARY_SET.FVB_PR = HEX("2A2051")
	G.C.SECONDARY_SET.FVB_SC = HEX("E0569B")
end

function add_card_to_title(use_key)
	local newcard = SMODS.create_card({
		set = "Joker",
		area = G.title_top,
		key = use_key,
		no_edition = true
	})
	-- recenter the title
	newcard:start_materialize({ G.C.WHITE, G.C.SECONDARY_SET.Personality }, true, 2.5)
	G.title_top:emplace(newcard)
	-- make the card look the same way as the title screen Ace of Spades
	newcard.T.w = newcard.T.w * 1.1 * 1.2
	newcard.T.h = newcard.T.h * 1.1 * 1.2
	newcard.no_ui = true
end

local main_menu_ref = Game.main_menu
Game.main_menu = function(change_context)
	local ret = main_menu_ref(change_context)
	-- adds a James to the main menu
	add_card_to_title("j_fvb_donnie_b")
	add_card_to_title("j_fvb_moose_salto")
	add_card_to_title("j_fvb_haru")
	G.title_top.T.w = G.title_top.T.w * 1.7675 * 1.2
	G.title_top.T.x = G.title_top.T.x - 0.8 * 1.8
	-- make the title screen use different background colors
	G.SPLASH_BACK:define_draw_steps({ {
		shader = 'splash',
		send = {
			{ name = 'time',       ref_table = G.TIMERS, ref_value = 'REAL_SHADER' },
			{ name = 'vort_speed', val = 0.4 },
			{ name = 'colour_1',   ref_table = G.C,      ref_value = 'FVB_PR' },
			{ name = 'colour_2',   ref_table = G.C,      ref_value = 'FVB_SC' },
		}
	} })

	return ret
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
	G.ARGS.LOC_COLOURS['buff'] = HEX("009B84")
	G.ARGS.LOC_COLOURS['fvb_pr'] = HEX("2A2051")
	G.ARGS.LOC_COLOURS['fvb_sc'] = HEX("E0569B")
    return G.ARGS.LOC_COLOURS[_c] or _default or G.C.UI.TEXT_DARK -- recalculate result
end

function eventify(fun)
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        func = function()
            fun()
            return true
        end
    }))
end

SMODS.Keybind({
    key_pressed = "delete",
    action = function (self)
        SMODS.restart_game()
    end
})
