import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/adventure/adventure_page.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/components/game/title_screen.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameLogic gameLogic = GameLogic();

    return Provider<GameLogic>(
      builder: (context) => gameLogic,
      dispose: (context, _) => gameLogic.dispose(),
      child: StreamBuilder<GameState>(
      stream: gameLogic.gameState,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        if (snapshot.data is GameStateTitleScreen) {
          return Center(
            child: TitleScreen(),
          );
        }
        if (snapshot.data is GameStatePlaying) {
          return AdventurePage();
        }
        if (snapshot.data is GameStateShop) {
          return Center(
            child: Text('shop'),
          );
        }
      }),
    );
  }
}
