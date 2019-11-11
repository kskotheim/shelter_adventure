import 'dart:async';
import 'dart:math';
import 'package:shelter_adventure/components/adventure/adventure.dart';
import 'package:shelter_adventure/components/challenge/challenge.dart';
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
  List<Challenge> challengesAchieved;

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
      theAdventure.numberOfTurnsUntilEnd += item.bonusTurns;
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
      // calculate challenges achieved ...
      challengesAchieved = [];
      int totalReward = 0;
      theChallenges.forEach((challenge){
        if(theAdventure.var0 >= challenge.minScores[0] && theAdventure.var1 >= challenge.minScores[1] && theAdventure.var2 >= challenge.minScores[2] && theAdventure.var3 >= challenge.minScores[3]){
          //challenge achieved
          challengesAchieved.add(challenge);
          totalReward += challenge.reward;
        }
      });
      gameLogic.addCurrency(totalReward);

    } else {
      //generate a new encounter
      currentEncounter = getRandomEncounter();
    }
    updateAdventure();
  }

  void dispose() {
    _adventureStreamController.close();
  }

  static List<int> previousEncounterIndexes = [];

  Encounter getRandomEncounter() {
    int index;
    do {
      index = (encounters.length * _random.nextDouble()).floor();
    } while (previousEncounterIndexes.contains(index));

    previousEncounterIndexes.add(index);
    return encounters[index];
  }
}
