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
    GameLogic gameLogic = Provider.of<GameLogic>(context);
    AdventureLogic logic = AdventureLogic(gameLogic: gameLogic);

    WidgetsBinding.instance.addPostFrameCallback((_) => onAfterBuild(context, logic));

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

  void onAfterBuild(BuildContext context, AdventureLogic adventureLogic) async {
    int tutorialPlace = adventureLogic.getTutorialPlace();
    if (tutorialPlace == 1) {
      await showResultDialog(
          context,
          "For your first game, try to get your 'Operations' score as high as possible.\n\nTap a choice once to see its results.\n\nTap again to confirm.",
      );
    } else if (tutorialPlace == 2) {
      // show more help
    }
  }

  Future<void> showResultDialog(BuildContext context, String result) async {
    double fontSize = 3000 / result.length;
    if (fontSize > 24.0) {
      fontSize = 24.0;
    }
    if (fontSize < 12.0) {
      fontSize = 12.0;
    }

    return showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(25.0),

            child: Text(
              result,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
          ),
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
