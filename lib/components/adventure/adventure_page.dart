import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/adventure/adventure.dart';
import 'package:shelter_adventure/components/adventure/adventure_logic.dart';
import 'package:shelter_adventure/components/encounter/encounter_widget.dart';
import 'package:shelter_adventure/util/style.dart';

class AdventurePage extends StatelessWidget {
  static AdventureLogic logic = AdventureLogic();

  @override
  Widget build(BuildContext context) {
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(),
                      Text('Game Over', style: Style.titleTextStyleBold,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Result:', style: Style.titleTextStyleBold,),
                          Text('Operations: ${logic.theAdventure.var1.toStringAsFixed(2)}', style: Style.subTitleTextStyle),
                          Text('Animals: ${logic.theAdventure.var2.toStringAsFixed(2)}', style: Style.subTitleTextStyle),
                          Text('Community: ${logic.theAdventure.var3.toStringAsFixed(2)}', style: Style.subTitleTextStyle),
                          Text('Personal: ${logic.theAdventure.var4.toStringAsFixed(2)}', style: Style.subTitleTextStyle),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: FlatButton(
                          onPressed: logic.newAdventure,
                          child: Text('New Adventure', style: Style.subTitleTextStyle,),
                        ),
                      ),
                    ],
                  );
                }

                // otherwise, proceed as usual
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width *
                              snapshot.data.pctOver,
                          height: 30.0,
                          color: Style.progressColor,
                        ),
                      ],
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