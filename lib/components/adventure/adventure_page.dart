import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/adventure/adventure.dart';
import 'package:shelter_adventure/components/adventure/adventure_logic.dart';
import 'package:shelter_adventure/components/encounter/encounter_widget.dart';
import 'package:shelter_adventure/components/adventure/game_over.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/util/style.dart';

class AdventurePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdventureLogic logic = AdventureLogic();
    GameLogic gameLogic = Provider.of<GameLogic>(context);
    return Scaffold(
      backgroundColor: Style.backgroundColor,
      body: Provider<AdventureLogic>(
        builder: (context) => logic,
        dispose: (context, value) => value.dispose(),
        child: Center(
          child: StreamBuilder<Adventure>(
              stream: logic.adventureStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();

                if (snapshot.data.adventureOver) {
                  // if the game is over, return the ending screen
                  return GameOverPage();
                }

                // otherwise, proceed as usual
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: gameLogic.inventory.equippedItems
                          .map((item) => Text("${item.name}  "))
                          .toList(),
                    ),
                    GameProgressRow(
                      pctOver: snapshot.data.pctOver,
                    ),
                    EncounterWidget(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class GameProgressRow extends StatelessWidget {
  final pctOver;

  GameProgressRow({this.pctOver});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * pctOver,
          height: Style.progressRowHeight,
          color: Style.progressColor,
        ),
      ],
    );
  }
}
