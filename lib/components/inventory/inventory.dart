// this class represents the user's selected items
// it is also exported and imported from shared preferences
// with the toString method and fromString constructor

import 'dart:convert';

import 'package:shelter_adventure/components/inventory/item.dart';
import 'package:shelter_adventure/components/inventory/item_list.dart';

class Inventory {
  // strings for saving and retrieving inventory from map
  static const String INVENTORY_SIZE = 'Inventory_Size';
  static const String EQUIPPED_ITEM_IDS = 'Equipped_Item_Ids';
  static const String UNLOCKED_ITEMS = 'Unlocked_Items';
  static const int BASE_INVENTORY_SIZE = 3;
  static const List<String> BASE_UNLOCKED_INVENTORY = [];

  int inventorySize;
  List<String> equippedItemIds;
  List<Item> get equippedItems => equippedItemIds
      .map((id) => theItems.where((item) => item.itemId == id).toList()[0])
      .toList();

  List<String> unlockedItemIds;

  Inventory({
    this.inventorySize = BASE_INVENTORY_SIZE,
    this.unlockedItemIds,
    this.equippedItemIds,
  }) {
    if (equippedItemIds == null) equippedItemIds = List<String>();
    if (unlockedItemIds == null) unlockedItemIds = List<String>.from(BASE_UNLOCKED_INVENTORY);
  }

  void setInventorySize(int newSize) => inventorySize = newSize;
  
  // call these from inventoryLogic so that inventory is saved in sharedPreferences
  void equipItem(String itemId) {
    if(equippedItemIds.length < inventorySize) equippedItemIds.add(itemId);
    _setInventorySize();
  }

  void unequipItem(String itemId) {
    if (equippedItemIds.contains(itemId)) equippedItemIds.remove(itemId);
    _setInventorySize();
  }
  
  void unlockItem(String itemId) {
    if(!unlockedItemIds.contains(itemId)) unlockedItemIds.add(itemId);
  }

  void _setInventorySize(){
    inventorySize = BASE_INVENTORY_SIZE;
    equippedItems.forEach((item){
      inventorySize += item.bonusInventory;
    });
    if(inventorySize < equippedItemIds.length) {
      equippedItemIds = equippedItemIds.take(inventorySize).toList();
    }
  }

  // these methods are for converting the inventory to/from a string
  // for storing or retrieving the inventory in shared preferences
  static Inventory _fromMap(Map<String, dynamic> inventory) {
    return Inventory(
        inventorySize: inventory[INVENTORY_SIZE] ?? BASE_INVENTORY_SIZE,
        equippedItemIds: List<String>.from(inventory[EQUIPPED_ITEM_IDS] ?? []) ,
        unlockedItemIds: List<String>.from(inventory[UNLOCKED_ITEMS] ?? BASE_UNLOCKED_INVENTORY));
  }

  Map<String, dynamic> get _toMap => {
        INVENTORY_SIZE: inventorySize,
        EQUIPPED_ITEM_IDS: equippedItemIds,
        UNLOCKED_ITEMS: unlockedItemIds
      };

  static Inventory fromString(String inventory) {
    if (inventory.length > 0)
      return _fromMap(jsonDecode(inventory));
    else
      return Inventory();
  }

  @override
  String toString() => jsonEncode(_toMap);
}
