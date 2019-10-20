
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/adventure/adventure_logic.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/util/style.dart';

class GameOverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdventureLogic adventureLogic = Provider.of<AdventureLogic>(context);
    GameLogic gameLogic = Provider.of<GameLogic>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(),
        Text(
          'Game Over',
          style: Style.titleTextStyleBold,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Result:',
              style: Style.titleTextStyleBold,
            ),
            Text('Operations: ${adventureLogic.theAdventure.var1}',
                style: Style.subTitleTextStyle),
            Text('Animals: ${adventureLogic.theAdventure.var2}',
                style: Style.subTitleTextStyle),
            Text('Community: ${adventureLogic.theAdventure.var3}',
                style: Style.subTitleTextStyle),
            Text('Personal: ${adventureLogic.theAdventure.var4}',
                style: Style.subTitleTextStyle),
          ],
        ),
        Container(
          decoration: Style.borderBoxDecoration,
          child: FlatButton(
            onPressed: gameLogic.showTitleScreen,
            child: Text(
              'title',
              style: Style.subTitleTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
