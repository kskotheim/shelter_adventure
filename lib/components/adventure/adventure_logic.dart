import 'dart:async';
import 'dart:math';
import 'package:shelter_adventure/components/adventure/adventure.dart';
import 'package:shelter_adventure/components/challenge/challenge.dart';
import 'package:shelter_adventure/components/encounter/encounter.dart';
import 'package:shelter_adventure/components/encounter/encounters_list.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/components/inventory/item.dart';

// this class calculates the effects of the previous decision and modifies the current adventure
// it starts and stops the listeners when created and disposed, so it ought to be properly disposed
class AdventureLogic {
  Adventure theAdventure;
  GameLogic gameLogic;
  Encounter currentEncounter;
  Random _random = Random();
  int numberOfTurns = 0;
  List<double> totalMultiplicativeBonus = [1.0, 1.0, 1.0, 1.0];
  List<int> totalEveryEncounterBonus = [0, 0, 0, 0];
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
      totalMultiplicativeBonus[i] *= item.multiplicativeBonus[i];
      theAdventure.numberOfTurnsUntilEnd += item.bonusTurns;
      totalEveryEncounterBonus[i] += item.everyEncounterBonus[i];
    }
  }

  StreamController<Adventure> _adventureStreamController =
      StreamController<Adventure>();

  Stream<Adventure> get adventureStream => _adventureStreamController.stream;
  void updateAdventure() => _adventureStreamController.sink.add(theAdventure);

  int getTutorialPlace() {
    if (gameLogic.isFirstGame) {
      if (numberOfTurns == 0) {
        return 1;
      }
    }

    return 0;
  }

  int _applyMultiplyBonus(int increment, int index) => (increment * totalMultiplicativeBonus[index]).round();

  int _applyEveryEncounterBonus(int increment, int index) => (increment + totalEveryEncounterBonus[index]);

  int _calculateBonuses(int increment, int index) {
    return _applyMultiplyBonus(_applyEveryEncounterBonus(increment, index), index);
  }

  void incrementAdventure(bool agreeToProposition) {
    // depending on the proposition, and whether the user agrees,
    // increment the game state and then update the adventure
    for (int ind = 0; ind < 4; ind++) {
      theAdventure.incrementVar(
        ind,
        _calculateBonuses(
            (agreeToProposition ? currentEncounter.agreeEffect[ind] : currentEncounter.disagreeEffect[ind]),
            ind
        )
      );
    }

    numberOfTurns++;
    theAdventure.pctOver =
        numberOfTurns / (theAdventure.numberOfTurnsUntilEnd - 1);
    if (numberOfTurns >= theAdventure.numberOfTurnsUntilEnd) {
      // end adventure ...
      theAdventure.adventureOver = true;
      // calculate challenges achieved ...
      challengesAchieved = [];
      var categoryRewards = {};

      theChallenges.forEach((challenge){
        if(theAdventure.var0 >= challenge.minScores[0] && theAdventure.var1 >= challenge.minScores[1] && theAdventure.var2 >= challenge.minScores[2] && theAdventure.var3 >= challenge.minScores[3]){
          //challenge achieved
          categoryRewards.putIfAbsent(challenge.category, () => {'reward': 0, 'challenge': {}});

          if (challenge.category == 'none') {
            categoryRewards[challenge.category]['reward'] += challenge.reward;
            challengesAchieved.add(challenge);
          } else {
            if (challenge.reward > categoryRewards[challenge.category]['reward']) {
              categoryRewards[challenge.category]['reward'] = challenge.reward;
              categoryRewards[challenge.category]['challenge'] = challenge;
            }
          }
        }
      });

      int totalReward = 0;
      categoryRewards.forEach((categoryName, categoryReward){
        if (categoryName != 'none') {
            totalReward += categoryReward['reward'];
            challengesAchieved.add(categoryReward['challenge']);
        }
      });

      gameLogic.addCurrency(totalReward);
      gameLogic.markGamePlayed();

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
