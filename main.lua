--- assert(SMODS.load_file('jokers/buffs.lua'))()
assert(SMODS.load_file('util/overrides.lua'))()
assert(SMODS.load_file('util/atlases.lua'))()
assert(SMODS.load_file('util/config_tab.lua'))()
assert(SMODS.load_file('mechanics/weaponslot.lua'))()
assert(SMODS.load_file('mechanics/seals.lua'))()
assert(SMODS.load_file('mechanics/backs.lua'))()
assert(SMODS.load_file('mechanics/challenges.lua'))()
assert(SMODS.load_file('mechanics/editions.lua'))()
assert(SMODS.load_file('mechanics/vouchers.lua'))()
assert(SMODS.load_file('consumables/weapons.lua'))()
assert(SMODS.load_file('consumables/packs.lua'))()
assert(SMODS.load_file('consumables/buffs.lua'))()
assert(SMODS.load_file('consumables/debuffs.lua'))()
assert(SMODS.load_file('consumables/hot_cards.lua'))()
assert(SMODS.load_file('jokers/personality.lua'))()
assert(SMODS.load_file('jokers/standard.lua'))()
if next(SMODS.find_mod('Talisman')) then
    assert(SMODS.load_file('util/talisman_compat.lua'))()
end

if next(SMODS.find_mod("JokerDisplay")) then
    print('hi jokerdisplay!')
    assert(SMODS.load_file('util/jokerdisplay_compat.lua'))()
end

if next(SMODS.find_mod('Maximus')) then
    assert(SMODS.load_file('util/maximus_compat.lua'))()
end

SMODS.current_mod.optional_features = function()
    return {
        retrigger_joker = true,
        cardareas = {
            weapons = true,
        },
    }
end

---Levels up hand (with proper animation) [from JoyousSpring]
---@param card Card|table
---@param hand_key string
---@param instant boolean?
---@param amount integer?
function rae_level_up_hand(card, hand_key, instant, amount)
    if not instant then
        update_hand_text({
            sound = "button",
            volume = 0.7,
            pitch = 0.8,
            delay = 0.3
        }, {
            handname = localize(hand_key, "poker_hands"),
            chips = G.GAME.hands[hand_key].chips,
            mult = G.GAME.hands[hand_key].mult,
            level = G.GAME.hands[hand_key].level
        })
    end
    level_up_hand(card, hand_key, instant, amount)
    if not instant then
        update_hand_text({
            sound = "button",
            volume = 0.7,
            pitch = 1.1,
            delay = 0
        }, {mult = 0, chips = 0, handname = "", level = ""})
    end
end