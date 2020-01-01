import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/challenge/challenge.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/util/style.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameLogic gameLogic = Provider.of<GameLogic>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Challenges',
              style: Style.titleTextStyleBold,
            ),
            Container(
              height: Style.itemListSize(context) * 1.1,
              color: new Color(0xFFEEEEFF),
              child: ListView(
                children: theChallenges
                    .map((challenge) => ListTile(
                          title: Text(challenge.description),
                          leading: Container(
                            height: 35.0,
                            width: 70.0,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Center(child: Text("+${challenge.reward}")),
                          ),
                        ))
                    .toList(),
              ),
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
