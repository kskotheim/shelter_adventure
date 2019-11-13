import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/util/style.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameLogic gameLogic = Provider.of<GameLogic>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Shop',
              style: Style.titleTextStyleBold,
            ),
            FlatButton(
              child: Text('Back'),
              onPressed: gameLogic.showTitleScreen,
            )
          ],
        ),
      ),
    );
  }
}
