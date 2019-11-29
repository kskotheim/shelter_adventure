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
        Text(
          'Game Over',
          style: Style.titleTextStyleBold,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                  children: <Widget>[
                    Text('${adventureLogic.theAdventure.var0}',
                        style: Style.subTitleTextStyle),
                    Text('Operations', style: Style.subTitleTextStyleSmall),
                    Text('${adventureLogic.theAdventure.var2}',
                        style: Style.subTitleTextStyle),
                    Text('Community', style: Style.subTitleTextStyleSmall),
                  ]
              ),
              Text("   "),
              Column(
                  children: <Widget>[
                    Text('${adventureLogic.theAdventure.var1}',
                        style: Style.subTitleTextStyle),
                    Text('Animals', style: Style.subTitleTextStyleSmall),
                    Text('${adventureLogic.theAdventure.var3}',
                        style: Style.subTitleTextStyle),
                    Text('Personal', style: Style.subTitleTextStyleSmall),
                  ]
              ),
            ]
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Challenges Achieved',
              style: Style.subTitleTextStyleSmall,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: adventureLogic.challengesAchieved.length == 0 ?
                  <Widget>[
                    Text("\nNone")
                  ] :
              adventureLogic.challengesAchieved.map(
                (challenge) {
                  return Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      height: 80.0,
                      width: 150.0,
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(12.0), color: Colors.yellow.shade50),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(challenge.name, style: TextStyle(fontSize: 12.0),),
                            Text('+${challenge.reward.toString()} Biscuit' + (challenge.reward == 1 ? '' : 's'))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            )
          ]
        ),
        Text(
          'Biscuits: ${gameLogic.currency}',
          style: Style.subTitleTextStyle
        ),
        Container(
          decoration: Style.borderBoxDecoration,
          child: FlatButton(
            onPressed: gameLogic.showTitleScreen,
            child: Text(
              'OK',
              style: Style.subTitleTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
