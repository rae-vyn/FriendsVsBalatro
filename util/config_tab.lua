FVB = {vars = {}, funcs = {}, cards = {}, content = SMODS.current_mod}
function FVB.content.save_config(self)
    SMODS.save_mod_config(self)
end
SMODS.current_mod.config_tab = function ()
    return {n=G.UIT.ROOT, config = {r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK}, nodes = {
        {n = G.UIT.C, config = {r = 0.1, minw = 4, align = "tl", padding = 0.2, colour = G.C.BLACK}, nodes =
            {
                {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        r = 0.1,
                        emboss = 0.1,
                        outline = 1,
                        padding = 0.14
                    },
                    nodes = {
                        create_toggle({
                            id = "accuracy_toggle",
                            label = G.localization.misc.dictionary.fvb_show_acc,
                            info = G.localization.misc.dictionary.fvb_show_acc_desc,
                            ref_table = FVB.content.config,
                            ref_value = "accuracy_toggle",
                            callback = function ()
                                FVB.content.save_config()
                            end
                        })
                    }
                }
            }
        }
    }
}
end