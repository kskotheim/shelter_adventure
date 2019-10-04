import 'dart:math';

class Encounter{
  // to do: add third option, or move options to array, that factors in currency

  String text;
  String agreeText;
  String disagreeText;
  List<num> agreeEffect;
  List<num> disagreeEffect;
  Random _random = Random();

  Encounter({this.text, this.agreeEffect, this.disagreeEffect, this.agreeText, this.disagreeText}){
    if(text == null){
      text = 'this is a new encounter';
    }
    if(agreeText == null){
      agreeText = "Yes";
    }
    if(disagreeText == null){
      disagreeText = "No";
    }

    if(agreeEffect == null){
      agreeEffect = [
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
      ];
    }
    if(disagreeEffect == null){
      disagreeEffect = [
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
      ];
    }
  }

}