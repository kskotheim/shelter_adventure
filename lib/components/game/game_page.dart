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

    return Provider<GameLogic>(
      builder: (context) => gameLogic,
      dispose: (context, _) => gameLogic.dispose(),
      child: StreamBuilder<GameState>(
        stream: gameLogic.gameState,
        builder: (context, snapshot) {
          return WillPopScope(
            onWillPop: () async {
              if(snapshot.data is GameStateTitleScreen){
                return showDialog(context: context, builder: (context) => ConfirmDialog(title: 'Exit?',));
              }
              else if(snapshot.data is GameStatePlaying){
                bool optToEnd = await showDialog(context: context, builder: (context) => ConfirmDialog(title: 'End Adventure?',));
                if(optToEnd){
                  gameLogic.showTitleScreen();
                }
              }
              else {
                gameLogic.showTitleScreen();
              }
              return false;
            },
            child: Builder(
              builder: (context) {
                if (!snapshot.hasData)
                  return CircularProgressIndicator();
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
          );
        },
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

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String positiveText;
  final String negativeText;

  ConfirmDialog({this.title = 'Confirm?', this.positiveText = 'Yes', this.negativeText = 'Cancel'});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      children: <Widget>[
        FlatButton(
          child: Text(positiveText),
          onPressed: () => Navigator.pop(context, true),
        ),
        FlatButton(
          child: Text(negativeText),
          onPressed: () => Navigator.pop(context, false),
        ),
      ],
    );
  }
}
