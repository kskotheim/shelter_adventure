import 'dart:async';

class GameLogic{

  StreamController<GameState> _gameStateController = StreamController<GameState>();
  Stream<GameState> get gameState => _gameStateController.stream;
  void showTitleScreen() => _gameStateController.sink.add(GameStateTitleScreen());
  void showGameScreen() => _gameStateController.sink.add(GameStatePlaying());
  void showShop() => _gameStateController.sink.add(GameStateShop());

  GameLogic(){
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