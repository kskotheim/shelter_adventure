import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/adventure/adventure.dart';
import 'package:shelter_adventure/components/adventure/adventure_logic.dart';
import 'package:shelter_adventure/components/encounter/encounter_logic.dart';

class EncounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdventureLogic adventureLogic = Provider.of<AdventureLogic>(context);
    EncounterLogic encounterLogic = EncounterLogic();

    return Provider<EncounterLogic>(
      dispose: (context, _) => encounterLogic.dispose(),
      builder: (context) => encounterLogic,
      child: Container(
        height: MediaQuery.of(context).size.height * .8,
        child: StreamBuilder<OptionSelected>(
            stream: encounterLogic.optionSelected,
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // game stat widgets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      statWidget(
                        'Operations',
                        adventureLogic.theAdventure.var1,
                        snapshot.data,
                        [
                          adventureLogic.currentEncounter.agreeEffect[0],
                          adventureLogic.currentEncounter.disagreeEffect[0]
                        ],
                      ),
                      statWidget(
                        'Animals',
                        adventureLogic.theAdventure.var2,
                        snapshot.data,
                        [
                          adventureLogic.currentEncounter.agreeEffect[1],
                          adventureLogic.currentEncounter.disagreeEffect[1]
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      statWidget(
                        'Community',
                        adventureLogic.theAdventure.var3,
                        snapshot.data,
                        [
                          adventureLogic.currentEncounter.agreeEffect[2],
                          adventureLogic.currentEncounter.disagreeEffect[2]
                        ],
                      ),
                      statWidget(
                        'Personal',
                        adventureLogic.theAdventure.var4,
                        snapshot.data,
                        [
                          adventureLogic.currentEncounter.agreeEffect[3],
                          adventureLogic.currentEncounter.disagreeEffect[3]
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(adventureLogic.currentEncounter.text),
                  ),
                  Container(
                    decoration: (snapshot.data is YesSelected)
                        ? BoxDecoration(border: Border.all())
                        : null,
                    child: FlatButton(
                      child: Text(adventureLogic.currentEncounter.agreeText),
                      onPressed: () async {
                        // check if this option is not yet selected
                        if (!(snapshot.data is YesSelected)) {
                          encounterLogic.selectYes();
                        }
                        // otherwise go ahead
                        else {
                          if (adventureLogic.currentEncounter.agreeResultText !=
                              null) {
                            await showResultDialog(
                              context,
                              adventureLogic.currentEncounter.agreeResultText,
                            );
                          }
                          adventureLogic.incrementAdventure(true);
                        }
                      },
                    ),
                  ),
                  Container(
                    // add a border if no is selected
                    decoration: (snapshot.data is NoSelected)
                        ? BoxDecoration(border: Border.all())
                        : null,
                    child: FlatButton(
                      child: Text(adventureLogic.currentEncounter.disagreeText),
                      onPressed: () async {
                        // check if this option is not yet selected
                        if (!(snapshot.data is NoSelected)) {
                          encounterLogic.selectNo();
                        }
                        // otherwise go ahead
                        else {
                          if (adventureLogic
                                  .currentEncounter.disagreeResultText !=
                              null) {
                            await showResultDialog(
                              context,
                              adventureLogic
                                  .currentEncounter.disagreeResultText,
                            );
                          }
                          adventureLogic.incrementAdventure(false);
                        }
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget statWidget(
    String title,
    num statValue,
    OptionSelected selectedOption,
    List<num> effectsList,
  ) {
    String displayString = statValue.toStringAsFixed(1);
    if (!(selectedOption is NothingSelected)) {
      if (selectedOption is YesSelected) {
        num effect = effectsList[0] ?? '';
        if (effect != 0) {
          if (effect > 0) {
            displayString += ' + ${effect.toStringAsPrecision(1)}';
          } else {
            displayString += ' - ${effect.abs().toStringAsPrecision(1)}';
          }
        }
      }
      if (selectedOption is NoSelected) {
        num effect = effectsList[1];
        if (effect != 0) {
          if (effect > 0) {
            displayString += ' + ${effect.toStringAsPrecision(1)}';
          } else {
            displayString += ' - ${effect.abs().toStringAsPrecision(1)}';
          }
        }
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 80.0,
          child: Text(
            displayString,
            textAlign: TextAlign.center,
          ),
        ),
        Text(title),
      ],
    );
  }

  Future<void> showResultDialog(BuildContext context, String result) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(result),
      ),
    );
  }
}
