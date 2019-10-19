import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/adventure/adventure.dart';
import 'package:shelter_adventure/components/adventure/adventure_logic.dart';
import 'package:shelter_adventure/components/encounter/encounter_widget.dart';

class AdventurePage extends StatelessWidget {
  static AdventureLogic logic = AdventureLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text('Game Over'),
                      FlatButton(
                        onPressed: logic.newAdventure,
                        child: Text('New Adventure'),
                      ),
                    ],
                  );
                }

                // otherwise, proceed as usual
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Shelter Adventure',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width *
                              snapshot.data.pctOver,
                          height: 30.0,
                          color: Colors.green.shade300,
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