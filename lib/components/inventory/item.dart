// this class represents the items you equip
class Item {
  final String itemId;
  final String name;
  final String effectString;
  final List<int> additiveBonus;
  final List<int> everyEncounterBonus;
  final List<double> multiplicativeBonus;
  final int bonusTurns;
  final int bonusInventory;
  final int costToUnlock;

  Item({
    this.itemId,
    this.name = 'item name',
    this.effectString = 'item effect',
    this.additiveBonus = const [0, 0, 0, 0],
    this.everyEncounterBonus = const [0, 0, 0, 0],
    this.multiplicativeBonus = const [1.0, 1.0, 1.0, 1.0],
    this.bonusTurns = 0,
    this.bonusInventory = 0,
    this.costToUnlock = 25,
  }) : assert(itemId != null);
}
