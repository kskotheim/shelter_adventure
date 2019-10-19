import 'dart:async';

import 'package:shelter_adventure/components/adventure/adventure_logic.dart';

class EncounterLogic {

  final AdventureLogic theAdventure;

  EncounterLogic({this.theAdventure}){
    assert(theAdventure != null);
    _optionSelectedStream.sink.add(NothingSelected());
  }

  StreamController<OptionSelected> _optionSelectedStream = StreamController<OptionSelected>();
  Stream<OptionSelected> get optionSelected => _optionSelectedStream.stream;
  void selectYes() => _optionSelectedStream.sink.add(YesSelected());
  void selectNo() => _optionSelectedStream.sink.add(NoSelected());

  void dispose(){
    _optionSelectedStream.close();
  }
}

 

//Option selected types for stream that tracks whether an option has been selected
abstract class OptionSelected{}
class NothingSelected extends OptionSelected{}
class YesSelected extends OptionSelected {}
class NoSelected extends OptionSelected {}