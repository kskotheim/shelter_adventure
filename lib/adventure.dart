import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/encounter.dart';

class AdventurePage extends StatelessWidget {
  // The adventure page is the ui representation of the current game in its current state
  // when a new game is started, a new Adventure instance is created
  final Adventure _adventure = Adventure();

  @override
  Widget build(BuildContext context) {
    AdventureLogic logic = AdventureLogic(theAdventure: _adventure);

    // the scaffold is an important 'material widget' that other widgets below it depend on
    // the body of the scaffold is what we see on the screen
    return Scaffold(
      // provider is a library that helps with state management, in this case by providing access
      // to, and properly disposing of, the adventure logic class
      body: Provider<AdventureLogic>(
        builder: (context) => logic,
        dispose: (context, value) => value.dispose(),
        child: Center(
          // rather than use stateful widgets, and rebuild everything explicitely with setState,
          // the stream builder connects the ui to a stream of data and re-runs the 'builder'
          // method whenever the data (snapshot.data) in the stream changes.
          child: StreamBuilder<Adventure>(
              stream: logic.adventureStream,
              builder: (context, snapshot) {
                // if the stream is empty, return a loading icon
                if (!snapshot.hasData) return CircularProgressIndicator();

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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        statWidget("Operations",
                            "${snapshot.data._var1.toStringAsFixed(1)}"),
                        statWidget("Animal Welfare",
                            "${snapshot.data._var2.toStringAsFixed(1)}"),
                        statWidget("Community Health",
                            "${snapshot.data._var3.toStringAsFixed(1)}"),
                        statWidget("Personal Health",
                            "${snapshot.data._var4.toStringAsFixed(1)}"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(logic.currentEncounter.text),
                    ),
                    FlatButton(
                      onPressed: () => logic.incrementAdventure(true),
                      child: Text('Agree'),
                    ),
                    FlatButton(
                      onPressed: () => logic.incrementAdventure(false),
                      child: Text('Disagree'),
                    ),
                    Container(),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget statWidget(String name, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 80.0,
          child: Text(
            name,
            textAlign: TextAlign.center,
          ),
        ),
        Text(text),
      ],
    );
  }
}

// this class represents the state of the current game

class Adventure {
  // the underscore means a variable is private
  double _var1;
  double _var2;
  double _var3;
  double _var4;

  // public getter methods so the variables can be accessed, but not modified directly, from outsie of this class
  double get var1 => _var1;
  double get var2 => _var2;
  double get var3 => _var3;
  double get var4 => _var4;

  // the constructor
  Adventure() {
    _var1 = 0.5;
    _var2 = 0.5;
    _var3 = 0.5;
    _var4 = 0.5;
  }

  //variable modification is permitted through method calls
  void incrementVar1(num x) => _var1 += x;
  void incrementVar2(num x) => _var2 += x;
  void incrementVar3(num x) => _var3 += x;
  void incrementVar4(num x) => _var4 += x;
}

// this class calculates the effects of the previous decision and modifies the current adventure
// it starts and stops the listeners when created and disposed, so it ought to be properly disposed

class AdventureLogic {
  Adventure theAdventure;
  Encounter currentEncounter;
  Random _random = Random();

  AdventureLogic({this.theAdventure}) {
    assert(theAdventure != null);
    currentEncounter = getRandomEncounter();
    _updateAdventure();
  }

  StreamController<Adventure> _adventureStreamController =
      StreamController<Adventure>();

  Stream<Adventure> get adventureStream => _adventureStreamController.stream;
  void _updateAdventure() => _adventureStreamController.sink.add(theAdventure);

  void incrementAdventure(bool agreeToProposition) {

    // depending on the proposition, and whether the user agrees, 
    // increment the game state and then update the adventure
    if (agreeToProposition) {
      theAdventure.incrementVar1(currentEncounter.agreeEffect[0]);
      theAdventure.incrementVar2(currentEncounter.agreeEffect[1]);
      theAdventure.incrementVar3(currentEncounter.agreeEffect[2]);
      theAdventure.incrementVar4(currentEncounter.agreeEffect[3]);
    } else {
      theAdventure.incrementVar1(currentEncounter.disagreeEffect[0]);
      theAdventure.incrementVar2(currentEncounter.disagreeEffect[1]);
      theAdventure.incrementVar3(currentEncounter.disagreeEffect[2]);
      theAdventure.incrementVar4(currentEncounter.disagreeEffect[3]);
    }

    //generate a new encounter
    currentEncounter = getRandomEncounter();

    _updateAdventure();
  }

  void dispose() {
    _adventureStreamController.close();
  }




  static int previousEncounterIndex = -1;
  static List<Encounter> encounters = [
    Encounter(text:'You meet a portly gopher who offers his services in exchange for a steady supply of grass roots'),
    Encounter(text: 'Two neighborhood cats ambush you in the alley and demand pets, or else'),
    Encounter(text: 'You are overcome with a sudden compulsion to dig a big hole in the back yard'),
    Encounter(text: 'Your cat reminds you that it is time for breakfast'),
    Encounter(text: 'Four friends approach you and gently remind you about that time you promised to throw a party for all of the neighborhood dogs'),
    Encounter(text: 'It is late. You should be getting home.'),
    Encounter(text: 'Your phone rings. It is your boss. He wants you to work this weekend.'),
    Encounter(text: 'The neighbors ask if you can look after their rabbits'),
  ];

  Encounter getRandomEncounter(){
    double _randomSeed = _random.nextDouble();
    int index = (encounters.length * _randomSeed).floor();
    
    while(index == previousEncounterIndex){
      _randomSeed = _random.nextDouble();
      index = (encounters.length * _randomSeed).floor();
    }
    
    previousEncounterIndex = index;
    return encounters[index];
  }

}
