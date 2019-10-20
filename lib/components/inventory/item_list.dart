// this class represents the items you equip
class Item {
  final String itemId;
  final String name;
  final String effectString;
  final List<int> additiveBonus;
  final List<double> multiplicitiveBonus;

  Item({
    this.itemId,
    this.name = 'item name',
    this.effectString = 'item effect',
    this.additiveBonus = const [0, 0, 0, 0],
    this.multiplicitiveBonus = const [1.0, 1.0, 1.0, 1.0],
  }) : assert(itemId != null);
}


// these are all the items in the game
final List<Item> theItems = [
  Item(
    itemId: '1',
    name: 'Dog Bone',
    effectString: 'Bonus +20 starting Animal score',
    additiveBonus: [0,20,0,0],
  ),
  Item(
    itemId: '2',
    name: 'Rotary Phone',
    effectString: 'Bonus +20 starting Operations score',
    additiveBonus: [0,20,0,0],
  ),
  Item(
    itemId: '3',
    name: 'Bowl of Candy',
    effectString: 'Bonus +20 starting Community score',
    additiveBonus: [0,20,0,0],
  ),
  Item(
    itemId: '4',
    name: 'Yo-Yo',
    effectString: 'Bonus +20 starting Personal score',
    additiveBonus: [0,20,0,0],
  ),
];
