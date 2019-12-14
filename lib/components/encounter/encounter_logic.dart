import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shelter_adventure/components/adventure/adventure_logic.dart';
import 'package:shelter_adventure/components/encounter/encounter.dart';
import 'package:shelter_adventure/util/style.dart';

class EncounterLogic {
  final AdventureLogic adventureLogic;
  OptionSelected _selectedOption = NothingSelected();
  List<dynamic> statModificationWidgets = [null, null, null, null];

  Encounter _currentEncounter;
  List<List<num>> _resultsSortedByVar;

  EncounterLogic({this.adventureLogic}) {
    assert(adventureLogic != null);
    _optionSelectedStream.sink.add(_selectedOption);

    // find and sort the effects for the current encounter according to stat
    _currentEncounter = adventureLogic.currentEncounter;
    _resultsSortedByVar = [
      [_currentEncounter.agreeEffect[0], _currentEncounter.disagreeEffect[0]],
      [_currentEncounter.agreeEffect[1], _currentEncounter.disagreeEffect[1]],
      [_currentEncounter.agreeEffect[2], _currentEncounter.disagreeEffect[2]],
      [_currentEncounter.agreeEffect[3], _currentEncounter.disagreeEffect[3]]
    ];
  }

  StreamController<OptionSelected> _optionSelectedStream =
      StreamController<OptionSelected>();
  Stream<OptionSelected> get optionSelected =>
      _optionSelectedStream.stream.map(_saveSelectedOption);
  void _selectYes() => _optionSelectedStream.sink.add(YesSelected());
  void _selectNo() => _optionSelectedStream.sink.add(NoSelected());

  OptionSelected _saveSelectedOption(OptionSelected option) {
    _selectedOption = option;
    _setModificationText();
    return option;
  }

  // Method to set the text widgets for the stat widgets to display according to which option is selected
  // and what that option's effects are
  // it is called each time a new option (yes/no) is selected
  void _setModificationText() {
    if (!(_selectedOption is NothingSelected)) {
      statModificationWidgets = [null, null, null, null];
      for (int i = 0; i < 4; i++) {
        num effect =
            _resultsSortedByVar[i][_selectedOption is YesSelected ? 0 : 1];
        String symbol = '+';
        TextStyle textStyle = Style.subTitleTextStyleGreen;
        if (effect < 0) {
          symbol = '-';
          effect = effect.abs();
          textStyle = Style.subTitleTextStyleRed;
        }
        if (effect > 19) {
          statModificationWidgets[i] = Text(
            ' ' + symbol + symbol + symbol,
            style: textStyle,
          );
        } else if (effect > 9) {
          statModificationWidgets[i] = Text(
            ' ' + symbol + symbol,
            style: textStyle,
          );
        } else if (effect > 0) {
          statModificationWidgets[i] = Text(
            ' ' + symbol,
            style: textStyle,
          );
        }
      }
    }
  }

  // Methods to handle events for the 'yes' and 'no' game buttons.
  // They check if that option is already selected, and if it is, the
  // adventure logic is incremented and any result dialog is shown

  void noButtonPressed(BuildContext context) async {
    if (!(_selectedOption is NoSelected)) {
      _selectNo();
    } else {
      if (_currentEncounter.disagreeResultText != null) {
        await showResultDialog(
          context,
          _currentEncounter.disagreeResultText,
        );
      }
      adventureLogic.incrementAdventure(false);
    }
  }

  void yesButtonPressed(BuildContext context) async {
    if (!(_selectedOption is YesSelected)) {
      _selectYes();
    } else {
      if (_currentEncounter.agreeResultText != null) {
        await showResultDialog(
          context,
          _currentEncounter.agreeResultText,
        );
      }
      adventureLogic.incrementAdventure(true);
    }
  }

  // Method to show a pop-up dialog with a specified text
  Future<void> showResultDialog(BuildContext context, String result) async {
    double fontSize = 3000 / result.length;
    if (fontSize > 24.0) {
      fontSize = 24.0;
    }
    if (fontSize < 12.0) {
      fontSize = 12.0;
    }

    return showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            
            child: Text(
              result,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  void dispose() {
    _optionSelectedStream.close();
  }
}

//Option selected types for stream that tracks whether an option has been selected
abstract class OptionSelected {}

class NothingSelected extends OptionSelected {}

class YesSelected extends OptionSelected {}

class NoSelected extends OptionSelected {}
