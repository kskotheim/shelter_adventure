// this class represents the items you equip
class Item {
  final String itemId;
  final String name;
  final String effectString;
  final List<int> additiveBonus;
  final List<double> multiplicitiveBonus;
  final int bonusTurns;
  final int bonusInventory;
  final int costToUnlock;

  Item({
    this.itemId,
    this.name = 'item name',
    this.effectString = 'item effect',
    this.additiveBonus = const [0, 0, 0, 0],
    this.multiplicitiveBonus = const [1.0, 1.0, 1.0, 1.0],
    this.bonusTurns = 0,
    this.bonusInventory = 0,
    this.costToUnlock = 25,
  }) : assert(itemId != null);
}

// these are all the items in the game
final List<Item> theItems = [
  Item(
    itemId: '1',
    name: 'Rotary Phone',
    effectString: 'Bonus +20 starting Operations score',
    additiveBonus: [20, 0, 0, 0],
  ),
  Item(
    itemId: '2',
    name: 'Dog Bone',
    effectString: 'Bonus +20 starting Animal score',
    additiveBonus: [0, 20, 0, 0],
  ),
  Item(
    itemId: '3',
    name: 'Bowl of Candy',
    effectString: 'Bonus +20 starting Community score',
    additiveBonus: [0, 0, 20, 0],
  ),
  Item(
    itemId: '4',
    name: 'Yo-Yo',
    effectString: 'Bonus +20 starting Personal score',
    additiveBonus: [0, 0, 0, 20],
  ),
  Item(
    itemId: '5',
    name: 'Wi-Fi',
    effectString: '20% bonus to Operations effects',
    multiplicitiveBonus: [1.2, 1.0, 1.0, 1.0],
  ),
  Item(
    itemId: '6',
    name: 'Extra Nutrients',
    effectString: '20% bonus to Animals effects',
    multiplicitiveBonus: [1.0, 1.2, 1.0, 1.0],
  ),
  Item(
    itemId: '7',
    name: 'Coffee Machine',
    effectString: '20% bonus to Community effects',
    multiplicitiveBonus: [1.0, 1.0, 1.2, 1.0],
  ),
  Item(
    itemId: '8',
    name: 'Self Help Book',
    effectString: '20% Bonus to Personal effects',
    multiplicitiveBonus: [1.0, 1.0, 1.0, 1.2],
  ),
  Item(
    itemId: '9',
    name: 'Robot Receptionist',
    effectString: '+50 and 50% bonus to Operations',
    additiveBonus: [50, 0, 0, 0],
    multiplicitiveBonus: [1.5, 1.0, 1.0, 1.0],
  ),
  Item(
    itemId: '10',
    name: 'Bark Translator',
    effectString: '+50 and 50% bonus to Animals',
    additiveBonus: [0, 50, 0, 0],
    multiplicitiveBonus: [1.0, 1.5, 1.0, 1.0],
  ),
  Item(
    itemId: '11',
    name: 'Key to the City',
    effectString: '+50 and 50% bonus to Community',
    additiveBonus: [0, 0, 50, 0],
    multiplicitiveBonus: [1.0, 1.0, 1.5, 1.0],
  ),
  Item(
    itemId: '12',
    name: 'Lucky Underpants',
    effectString: '+50 and 50% bonus to Personal',
    additiveBonus: [0, 0, 0, 50],
    multiplicitiveBonus: [1.0, 1.0, 1.0, 1.5],
  ),
  Item(
    itemId: '13',
    name: 'Fanny Pack',
    effectString: '+2 to inventory size',
    bonusInventory: 2
  ),
  Item(
    itemId: '14',
    name: 'Big Fanny Pack',
    effectString: '+3 to inventory size',
    bonusInventory: 3
  ),
  Item(
    itemId: '15',
    name: 'Magic Flute',
    effectString: '+4 bonus turns',
    bonusTurns: 4
  ),
  Item(
    itemId: '16',
    name: 'Magic Fiddle',
    effectString: '+6 bonus turns',
    bonusTurns: 6
  ),

  Item(
    itemId: '17',
    name: 'Crystal Ball',
    effectString: '+100 bonus to all stats',
    additiveBonus: [100, 100, 100, 100],
  ),
  Item(
    itemId: '18',
    name: 'Dark Crystal Ball',
    effectString: '+300% bonus to all effects',
    multiplicitiveBonus: [3.0, 3.0, 3.0, 3.0],
  ),
];
