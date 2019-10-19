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
        EncounterLogic(adventureLogic: adventureLogic);

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
                        encounterLogic.statModificationTextWidgets[0],
                      ),
                      statWidget(
                        'Animals',
                        adventureLogic.theAdventure.var2,
                        encounterLogic.statModificationTextWidgets[1],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      statWidget(
                        'Community',
                        adventureLogic.theAdventure.var3,
                        encounterLogic.statModificationTextWidgets[2],
                      ),
                      statWidget(
                        'Personal',
                        adventureLogic.theAdventure.var4,
                        encounterLogic.statModificationTextWidgets[3],
                      ),
                    ],
                  ),

                  // The current encounter text
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      adventureLogic.currentEncounter.text,
                      style: Style.subTitleTextStyle,
                    ),
                  ),

                  // The yes button
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
                      onPressed: () => encounterLogic.yesButtonPressed(context),
                    ),
                  ),

                  // The no button
                  Container(
                    decoration: (snapshot.data is NoSelected)
                        ? BoxDecoration(border: Border.all())
                        : null,
                    child: FlatButton(
                      child: Text(
                        adventureLogic.currentEncounter.disagreeText,
                        style: Style.subTitleTextStyle,
                      ),
                      onPressed: () => encounterLogic.noButtonPressed(context),
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
      String title, double statValue, Text modificationText) {

    Text statText = Text(
      statValue.toStringAsFixed(1),
      textAlign: TextAlign.center,
      style: Style.subTitleTextStyle,
    );

    return Container(
      decoration: Style.statWidgetDecoration,
      padding: Style.statWidgetPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                statText,
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
}
