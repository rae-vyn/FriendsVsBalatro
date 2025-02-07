local init_item_prototypes_ref = Game.init_item_prototypes
function Game:init_item_prototypes()
  init_item_prototypes_ref(self)

  G.C.SECONDARY_SET.Weapon = HEX("E0569B")
end
