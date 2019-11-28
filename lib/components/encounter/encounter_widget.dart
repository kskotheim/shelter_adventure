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
        height: Style.adventureWidgetSize(context),
        child: StreamBuilder<OptionSelected>(
            stream: encounterLogic.optionSelected,
            builder: (context, snapshot) {
              encounterLogic.tutorial(context);

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // game stat widgets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      statWidget(
                        'Operations',
                        adventureLogic.theAdventure.var0,
                        encounterLogic.statModificationTextWidgets[0],
                      ),
                      statWidget(
                        'Animals',
                        adventureLogic.theAdventure.var1,
                        encounterLogic.statModificationTextWidgets[1],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      statWidget(
                        'Community',
                        adventureLogic.theAdventure.var2,
                        encounterLogic.statModificationTextWidgets[2],
                      ),
                      statWidget(
                        'Personal',
                        adventureLogic.theAdventure.var3,
                        encounterLogic.statModificationTextWidgets[3],
                      ),
                    ],
                  ),

                  // The current encounter text
                  Padding(
                    padding: Style.currentEncounterTextPadding,
                    child: Text(
                      adventureLogic.currentEncounter.text,
                      style: (adventureLogic.currentEncounter.text.length < 150 ? Style.subTitleTextStyle : Style.subTitleTextStyleSmall),
                    ),
                  ),

                  // The yes button
                  Container(
                    color: (snapshot.data is YesSelected)
                        ? Color(0xFFFFFFFF)
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
                    color: (snapshot.data is NoSelected)
                        ? Color(0xFFFFFFFF)
                        : null,
                    child: FlatButton(
                      child: Text(
                        adventureLogic.currentEncounter.disagreeText,
                        style: Style.subTitleTextStyle,
                        textAlign: TextAlign.center,
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
      String title, int statValue, Text modificationText) {

    Text statText = Text(
      statValue.toString(),
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
          Container(height: Style.distanceBetweenDescriptionAndStats),
          Container(
            width: Style.widthOfStatDescriptionBox,
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
