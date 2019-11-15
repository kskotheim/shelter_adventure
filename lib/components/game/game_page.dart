import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/adventure/adventure_page.dart';
import 'package:shelter_adventure/components/challenge/challenge_page.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/components/game/title_screen.dart';
import 'package:shelter_adventure/components/inventory/inventory_page.dart';
import 'package:shelter_adventure/components/shop/shop_page.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameLogic gameLogic = GameLogic();

    return WillPopScope(
      onWillPop: () async => showDialog(
        context: context,
        builder: (context) => ConfirmExitGameDialog(),
      ),
      child: Provider<GameLogic>(
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
              return ShopPage();
            }
            if (snapshot.data is GameStateInventory) {
              return Center(
                child: InventoryPage(),
              );
            }
            if (snapshot.data is GameStateLoading) {
              return LoadingScreen();
            }
            if (snapshot.data is GameStateChallenges) {
              return ChallengePage();
            }
          },
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('loading ...'),
      ),
    );
  }
}

class ConfirmExitGameDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Exit Game?'),
      children: <Widget>[
        FlatButton(
          child: Text('Yes, Exit'),
          onPressed: () => Navigator.pop(context, true),
        ),
        FlatButton(
          child: Text('No, Stay'),
          onPressed: () => Navigator.pop(context, false),
        )
      ],
    );
  }
}
