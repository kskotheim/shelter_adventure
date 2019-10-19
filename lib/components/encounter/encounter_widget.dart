import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/adventure/adventure_logic.dart';
import 'package:shelter_adventure/components/encounter/encounter_logic.dart';
import 'package:shelter_adventure/util/style.dart';

class EncounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdventureLogic adventureLogic = Provider.of<AdventureLogic>(context);
    EncounterLogic encounterLogic =
        EncounterLogic(theAdventure: adventureLogic);

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
                        adventureLogic.currentEncounter.resultsSortedByVar[0],
                      ),
                      statWidget(
                        'Animals',
                        adventureLogic.theAdventure.var2,
                        snapshot.data,
                        adventureLogic.currentEncounter.resultsSortedByVar[1],
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
                        adventureLogic.currentEncounter.resultsSortedByVar[2],
                      ),
                      statWidget(
                        'Personal',
                        adventureLogic.theAdventure.var4,
                        snapshot.data,
                        adventureLogic.currentEncounter.resultsSortedByVar[3],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      adventureLogic.currentEncounter.text,
                      style: Style.subTitleTextStyle,
                    ),
                  ),
                  Container(
                    decoration: (snapshot.data is YesSelected)
                        ? BoxDecoration(border: Border.all())
                        : null,
                    child: FlatButton(
                      child: Text(
                        adventureLogic.currentEncounter.agreeText,
                        style: Style.subTitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
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
                      child: Text(
                        adventureLogic.currentEncounter.disagreeText,
                        style: Style.subTitleTextStyle,
                      ),
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

  // the stat widgets display the values of the current adventure stats 
  // as well as any modifications from selected choices, if a choice is selected
  Widget statWidget(
    String title,
    num statValue,
    OptionSelected selectedOption,
    List<num> effectsList,
  ) {
    String displayString = statValue.toStringAsFixed(1);
    Text modificationText;
    if (!(selectedOption is NothingSelected)) {
      if (selectedOption is YesSelected) {
        num effect = effectsList[0] ?? '';
        if (effect != 0) {
          if (effect > 0) {
            modificationText = Text(' + ${effect.toStringAsPrecision(1)}', style: Style.subTitleTextStyleGreen,);
          } else {
            modificationText = Text(' - ${effect.abs().toStringAsPrecision(1)}', style: Style.subTitleTextStyleRed,);
          }
        }
      }
      if (selectedOption is NoSelected) {
        num effect = effectsList[1];
        if (effect != 0) {
          if (effect > 0) {
            modificationText = Text(' + ${effect.toStringAsPrecision(1)}', style: Style.subTitleTextStyleGreen,);
          } else {
            modificationText = Text(' - ${effect.abs().toStringAsPrecision(1)}', style: Style.subTitleTextStyleRed,);
          }
        }
      }
    }
    return Container(
      decoration: Style.statWidgetDecoration,
      padding: Style.statWidgetPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  displayString,
                  textAlign: TextAlign.center,
                  style: Style.subTitleTextStyle,
                ),
                modificationText != null ? modificationText : Container(),
              ],
            ),
          ),
          Container(height: 10.0),
          Container(
            width: 80.0,
            child: Text(
              title,
              style: Style.descriptionTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showResultDialog(BuildContext context, String result) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          result,
          style: Style.titleTextStyleBold,
        ),
      ),
    );
  }
}
