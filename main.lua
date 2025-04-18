--- assert(SMODS.load_file('jokers/buffs.lua'))()
assert(SMODS.load_file('util/overrides.lua'))()
assert(SMODS.load_file('util/atlases.lua'))()
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