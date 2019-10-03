
import 'dart:math';

class Encounter{

  String text;
  List<num> agreeEffect;
  List<num> disagreeEffect;
  Random _random = Random();

  Encounter({this.text, this.agreeEffect, this.disagreeEffect}){
    if(text == null){
      text = 'this is a new encounter';
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