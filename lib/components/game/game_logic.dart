import 'dart:async';

import 'package:shelter_adventure/components/inventory/inventory.dart';
import 'package:shelter_adventure/util/repository.dart';

class GameLogic{

  StreamController<GameState> _gameStateController = StreamController<GameState>();
  Stream<GameState> get gameState => _gameStateController.stream;

  void showLoadingScreen() => _gameStateController.sink.add(GameStateLoading());
  void showTitleScreen() => _gameStateController.sink.add(GameStateTitleScreen());
  void showGameScreen() => _gameStateController.sink.add(GameStatePlaying());
  void showInventory() => _gameStateController.sink.add(GameStateInventory());
  void showShop() => _gameStateController.sink.add(GameStateShop());

  SharedPrefsManager _sharedPrefs;
  Inventory _inventory;
  Inventory get inventory => _inventory;
  bool inventoryContains(String id) => _inventory.equippedItemIds.contains(id);
  bool unlockedItemsContains(String id) => _inventory.unlockedItemIds.contains(id);

  GameLogic(){
    showLoadingScreen();
    getInventory();
  }

  // loads the inventory from shared preferences when the game is opened
  void getInventory() async {
    _sharedPrefs = await SharedPrefsManager.getInstance();
    _inventory = Inventory.fromString(_sharedPrefs.getInventory());
    showTitleScreen();
  }

  void dispose(){
    _gameStateController.close();
  }

}


// classes to represent the state the game is in (title screen, playing, item shop)
class GameState{}

class GameStateTitleScreen extends GameState{}

class GameStatePlaying extends GameState{}

class GameStateShop extends GameState{}

class GameStateInventory extends GameState{}

class GameStateLoading extends GameState{}