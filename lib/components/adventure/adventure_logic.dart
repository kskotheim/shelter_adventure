import 'dart:async';
import 'dart:math';
import 'package:shelter_adventure/components/adventure/adventure.dart';
import 'package:shelter_adventure/components/encounter/encounter.dart';
import 'package:shelter_adventure/components/encounter/encounters_list.dart';

// this class calculates the effects of the previous decision and modifies the current adventure
// it starts and stops the listeners when created and disposed, so it ought to be properly disposed
class AdventureLogic {
  Adventure theAdventure;
  Encounter currentEncounter;
  Random _random = Random();
  int numberOfTurns = 0;

  void newAdventure() {
    theAdventure = Adventure();
    numberOfTurns = 0;
    currentEncounter = getRandomEncounter();
    _updateAdventure();
  }

  AdventureLogic({this.theAdventure}) {
    if (theAdventure == null) theAdventure = Adventure();
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

    numberOfTurns++;
    theAdventure.pctOver =
        numberOfTurns / (theAdventure.numberOfTurnsUntilEnd - 1);
    if (numberOfTurns >= theAdventure.numberOfTurnsUntilEnd) {
      // end adventure ...
      theAdventure.adventureOver = true;
    } else {
      //generate a new encounter
      currentEncounter = getRandomEncounter();
    }
    _updateAdventure();
  }

  void dispose() {
    _adventureStreamController.close();
  }

  static int previousEncounterIndex = -1;
  

  Encounter getRandomEncounter() {
    double _randomSeed = _random.nextDouble();
    int index = (encounters.length * _randomSeed).floor();

    while (index == previousEncounterIndex) {
      _randomSeed = _random.nextDouble();
      index = (encounters.length * _randomSeed).floor();
    }

    previousEncounterIndex = index;
    return encounters[index];
  }
}
