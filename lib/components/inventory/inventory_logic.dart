import 'dart:async';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/components/inventory/inventory.dart';
import 'package:shelter_adventure/components/inventory/item_list.dart';
import 'package:shelter_adventure/util/repository.dart';

class InventoryLogic {
  final GameLogic gameLogic;
  SharedPrefsManager _prefs;

  InventoryLogic({this.gameLogic}) {
    assert(gameLogic != null);
    _getSharedPrefs();
    updateInventory(gameLogic.inventory);
  }

  void _getSharedPrefs() async {
    _prefs = await SharedPrefsManager.getInstance();
  }

  StreamController<Inventory> _inventoryController =
      StreamController<Inventory>();
  Stream<Inventory> get inventoryStream => _inventoryController.stream;
  void updateInventory(Inventory inventory) =>
      _inventoryController.sink.add(inventory);

  void itemButtonPressed(String itemId) {
    if (gameLogic.unlockedItemsContains(itemId)) {
      if (!gameLogic.inventoryContains(itemId)) {
        gameLogic.inventory.equipItem(itemId);
      } else {
        gameLogic.inventory.unequipItem(itemId);
      }
      _saveInventory();
      updateInventory(gameLogic.inventory);
    } else {
      Item item = theItems.singleWhere((item) => item.itemId == itemId);
      if(gameLogic.currency >= item.costToUnlock){
        gameLogic.addCurrency(-1 * item.costToUnlock);
        unlockItem(itemId);
        updateInventory(gameLogic.inventory);
      }
    }
  }

  void unlockItem(String itemId) {
    gameLogic.inventory.unlockItem(itemId);
    _saveInventory();
  }

  void _saveInventory() async {
    if (_prefs != null) {
      _prefs.setInventory(gameLogic.inventory.toString());
    }
  }

  Function get saveInventory => _saveInventory;

  // these methods are for test buttons to unlock or reset the list of unlocked items
  void resetUnlockedItemsButtonPressed() {
    gameLogic.inventory.unlockedItemIds = List<String>.from(Inventory.BASE_UNLOCKED_INVENTORY);
    gameLogic.inventory.equippedItemIds = [];
    gameLogic.inventory.inventorySize = Inventory.BASE_INVENTORY_SIZE;
    saveInventory();
    updateInventory(gameLogic.inventory);
  }

  void unlockAllItemsButtonPressed() {
    theItems.forEach((item) => unlockItem(item.itemId));
    updateInventory(gameLogic.inventory);
  }

  void dispose() {
    _inventoryController.close();
  }
}
