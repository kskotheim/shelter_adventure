import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // The material app widget is the root of the application,
  // and is built once, when the app starts

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shelter Adventure',
      home: AdventurePage(),
    );
  }
}

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
                        iconAndData(Icons.alarm, "${snapshot.data._var1.toStringAsFixed(1)}"),
                        iconAndData(Icons.computer, "${snapshot.data._var2.toStringAsFixed(1)}"),
                        iconAndData(
                            Icons.transit_enterexit, "${snapshot.data._var3.toStringAsFixed(1)}"),
                        iconAndData(
                            Icons.trip_origin, "${snapshot.data._var4.toStringAsFixed(1)}"),
                      ],
                    ),
                    RandomProposition(),
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

  Widget iconAndData(IconData icon, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon),
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
  void increaseVar1() => _var1 += .1;
  void increaseVar2() => _var2 += .1;
  void increaseVar3() => _var3 += .1;
  void increaseVar4() => _var4 += .1;
  void decreaseVar1() => _var1 -= .1;
  void decreaseVar2() => _var2 -= .1;
  void decreaseVar3() => _var3 -= .1;
  void decreaseVar4() => _var4 -= .1;
}

// this class calculates the effects of the previous decision and modifies the current adventure
// it starts and stops the listeners when created and disposed, so it ought to be properly disposed

class AdventureLogic {
  Adventure theAdventure;

  AdventureLogic({this.theAdventure}) {
    assert(theAdventure != null);
    _updateAdventure();
  }

  StreamController<Adventure> _adventureStreamController =
      StreamController<Adventure>();

  Stream<Adventure> get adventureStream => _adventureStreamController.stream;
  void _updateAdventure() => _adventureStreamController.sink.add(theAdventure);

  void incrementAdventure(bool agreeToProposition) {
    // depending on the proposition, and whether the user agrees, and maybe some random number generator,
    // increment the game state and then update the adventure

    if (agreeToProposition) {
      if (Random().nextDouble() > .5) {
        theAdventure.increaseVar1();
        theAdventure.decreaseVar2();
      } else {
        theAdventure.decreaseVar1();
        theAdventure.increaseVar2();
      }
    } else {
      if (Random().nextDouble() > .5) {
        theAdventure.increaseVar3();
        theAdventure.decreaseVar4();
      } else {
        theAdventure.decreaseVar3();
        theAdventure.increaseVar4();
      }
    }

    _updateAdventure();
  }

  void dispose() {
    _adventureStreamController.close();
  }
}


class RandomProposition extends StatelessWidget {

  final double _randomSeed = Random().nextDouble();
  static const List<String> _propositions = [
    'You meet a portly gopher who offers his services in exchange for a steady supply of grass roots',
    'Two neighborhood cats ambush you in the alley and demand pets, or else',
    'You are overcome with a sudden compulsion to dig a big hole in the back yard',
    'Your cat reminds you that it is time for breakfast',
    'Four friends approach you and gently remind you about that time you promised to throw a party for all of the neighborhood dogs',
    'It is late. You should be getting home.',
    'Your phone rings. It is your boss. He wants you to work this weekend.',
    'The neighbors ask if you can look after their rabbits',
  ];


  @override
  Widget build(BuildContext context) {

    int index = (_propositions.length * _randomSeed).floor();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: Text(
        _propositions[index]
      ),
    );
  }
}