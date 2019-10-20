// this class represents the user's selected items
// it is also exported and imported from shared preferences
// with the toString method and fromString constructor

import 'dart:convert';

import 'package:shelter_adventure/components/inventory/item_list.dart';

class Inventory {
  // strings for saving and retrieving inventory from map
  static const String INVENTORY_SIZE = 'Inventory_Size';
  static const String EQUIPPED_ITEM_IDS = 'Equipped_Item_Ids';

  int inventorySize = 3;
  List<String> equippedItemIds = [];
  List<Item> get equippedItems => equippedItemIds
      .map((id) => theItems.where((item) => item.itemId == id).toList()[0]).toList();

  Inventory({this.inventorySize, this.equippedItemIds});

  void setInventorySize(int newSize) => inventorySize = newSize;
  void equipItem(String itemId) => equippedItemIds.add(itemId);
  void unequipItem(String itemId) {
    if (equippedItemIds.contains(itemId)) equippedItemIds.remove(itemId);
  }

  // these methods are for converting the inventory to/from a string
  // for storing or retrieving the inventory in shared preferences
  static Inventory _fromMap(Map<String, dynamic> inventory) {
    return Inventory(
        inventorySize: inventory[INVENTORY_SIZE] ?? 3,
        equippedItemIds: List<String>.from(inventory[EQUIPPED_ITEM_IDS]) ?? []);
  }

  Map<String, dynamic> get _toMap => {
        INVENTORY_SIZE: inventorySize,
        EQUIPPED_ITEM_IDS: equippedItemIds,
      };

  static Inventory fromString(String inventory) {
    if (inventory.length > 0)
      return _fromMap(jsonDecode(inventory));
    else
      return Inventory(equippedItemIds: [], inventorySize: 3);
  }

  @override
  String toString() => jsonEncode(_toMap);
}
