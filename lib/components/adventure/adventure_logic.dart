import 'dart:async';
import 'dart:math';
import 'package:shelter_adventure/components/adventure/adventure.dart';
import 'package:shelter_adventure/components/encounter/encounter.dart';

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
  static List<Encounter> encounters = [
    Encounter(
      text:
          'You meet a portly gopher who offers his services in exchange for a steady supply of grass roots',
      agreeText: 'accept the gophers services',
      agreeResultText: 'you agreed',
      disagreeResultText: 'you disagreed',
    ),
    Encounter(
      text:
          'Two neighborhood cats ambush you in the alley and demand pets, or else',
      agreeResultText: 'you agreed',
      disagreeResultText: 'you disagreed',
    ),
    Encounter(
        text:
            'You are overcome with a sudden compulsion to dig a big hole in the back yard'),
    Encounter(text: 'Your cat reminds you that it is time for breakfast'),
    Encounter(
        text:
            'Four friends approach you and gently remind you about that time you promised to throw a party for all of the neighborhood dogs'),
    Encounter(text: 'It is late. You should be getting home.'),
    Encounter(
        text:
            'Your phone rings. It is your boss. He wants you to work this weekend.'),
    Encounter(text: 'The neighbors ask if you can look after their rabbits'),
  ];

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
