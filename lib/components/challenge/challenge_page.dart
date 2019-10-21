import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameLogic gameLogic = Provider.of<GameLogic>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Challenges Page'),
            FlatButton(
              child: Text('Title'),
              onPressed: gameLogic.showTitleScreen,
            )
          ],
        ),
      ),
    );
  }
}
