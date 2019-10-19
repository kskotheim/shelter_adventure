import 'dart:math';

class Encounter {
  // to do: add third option, or move options to array, that factors in currency

  String text;
  String agreeText;
  String disagreeText;
  String agreeResultText;
  String disagreeResultText;
  List<num> agreeEffect;
  List<num> disagreeEffect;
  Random _random = Random();

  Encounter({
    this.text = 'this is a new encounter',
    this.agreeEffect,
    this.disagreeEffect,
    this.agreeText = 'Yes',
    this.disagreeText = 'No',
    this.agreeResultText,
    this.disagreeResultText,
  }) {

    if (agreeEffect == null) {
      agreeEffect = [
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
      ];
    }
    if (disagreeEffect == null) {
      disagreeEffect = [
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
        _random.nextDouble() - .5,
      ];
    }
  }
}
