import 'dart:async';
import 'dart:math';
import 'package:shelter_adventure/components/adventure/adventure.dart';
import 'package:shelter_adventure/components/encounter/encounter.dart';
import 'package:shelter_adventure/components/encounter/encounters_list.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/components/inventory/item_list.dart';

// this class calculates the effects of the previous decision and modifies the current adventure
// it starts and stops the listeners when created and disposed, so it ought to be properly disposed
class AdventureLogic {
  Adventure theAdventure;
  GameLogic gameLogic;
  Encounter currentEncounter;
  Random _random = Random();
  int numberOfTurns = 0;
  List<double> totalMultiplicitiveBonus = [1.0, 1.0, 1.0, 1.0];

  AdventureLogic({this.theAdventure, this.gameLogic}) {
    assert(gameLogic != null);
    if (theAdventure == null) theAdventure = Adventure();
    // apply item modifiers
    gameLogic.inventory.equippedItems.forEach(_applyItemBonuses);
    currentEncounter = getRandomEncounter();
    updateAdventure();
  }

  void _applyItemBonuses(Item item){
    for(int i=0; i<4; i++){
      theAdventure.incrementVar(i, item.additiveBonus[i]);
      totalMultiplicitiveBonus[i] *= item.multiplicitiveBonus[i];
    }
  }

  StreamController<Adventure> _adventureStreamController =
      StreamController<Adventure>();

  Stream<Adventure> get adventureStream => _adventureStreamController.stream;
  void updateAdventure() => _adventureStreamController.sink.add(theAdventure);

  int _applyMultiplyBonus(int increment, int index) => (increment * totalMultiplicitiveBonus[index]).round();

  void incrementAdventure(bool agreeToProposition) {
    // depending on the proposition, and whether the user agrees,
    // increment the game state and then update the adventure
    if (agreeToProposition) {
      theAdventure.incrementVar0(_applyMultiplyBonus(currentEncounter.agreeEffect[0], 0));
      theAdventure.incrementVar1(_applyMultiplyBonus(currentEncounter.agreeEffect[1], 1));
      theAdventure.incrementVar2(_applyMultiplyBonus(currentEncounter.agreeEffect[2], 2));
      theAdventure.incrementVar3(_applyMultiplyBonus(currentEncounter.agreeEffect[3], 3));
    } else {
      theAdventure.incrementVar0(currentEncounter.disagreeEffect[0]);
      theAdventure.incrementVar1(currentEncounter.disagreeEffect[1]);
      theAdventure.incrementVar2(currentEncounter.disagreeEffect[2]);
      theAdventure.incrementVar3(currentEncounter.disagreeEffect[3]);
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
    updateAdventure();
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
