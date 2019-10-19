import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/adventure/adventure_logic.dart';

class EncounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdventureLogic logic = Provider.of<AdventureLogic>(context);

    return Container(
      height: MediaQuery.of(context).size.height * .6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(logic.currentEncounter.text),
          ),
          FlatButton(
            onPressed: () async {
              if (logic.currentEncounter.agreeResultText != null)
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(logic.currentEncounter.agreeResultText),
                  ),
                );
              logic.incrementAdventure(true);
            },
            child: Text(logic.currentEncounter.agreeText),
          ),
          FlatButton(
            onPressed: () => logic.incrementAdventure(false),
            child: Text(logic.currentEncounter.disagreeText),
          ),
        ],
      ),
    );
  }
}
