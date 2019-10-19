import 'dart:async';

class EncounterLogic {

  EncounterLogic(){
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