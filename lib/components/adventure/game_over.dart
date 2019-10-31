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
        Row(
          mainAxisSize: MainAxisSize.min,
          children: adventureLogic.challengesAchieved.map(
            (challenge) {
              return Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  height: 60.0,
                  width: 100.0,
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(12.0), color: Colors.yellow.shade100),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(challenge.name, style: TextStyle(fontSize: 12.0),),
                        Text('+${challenge.reward.toString()} Biscuits')
                      ],
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Result:',
              style: Style.titleTextStyleBold,
            ),
            Text('Operations: ${adventureLogic.theAdventure.var0}',
                style: Style.subTitleTextStyle),
            Text('Animals: ${adventureLogic.theAdventure.var1}',
                style: Style.subTitleTextStyle),
            Text('Community: ${adventureLogic.theAdventure.var2}',
                style: Style.subTitleTextStyle),
            Text('Personal: ${adventureLogic.theAdventure.var3}',
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
