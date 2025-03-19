SMODS.Voucher({
    key = "cash_out",
    atlas = "money",
    redeem = function (self, voucher)
        G.FVB.buff_in_store = true
    end
})

SMODS.Voucher({
    key = "mo_money",
    atlas = "momoney",
    requires = {'v_fvb_cash_out'},
    redeem = function (self, voucher)
        G.FVB.debuff_in_store = true
    end
})

SMODS.Voucher({
    key = "friends",
    atlas = "friends",
    redeem = function (self, voucher)
        G.FVB.personalities_in_store = true
    end
})