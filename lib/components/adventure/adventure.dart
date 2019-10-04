// this class represents the state of the current game

class Adventure {
  // static Adventure _theAdventure = Adventure();
  // Adventure get theAdventure => _theAdventure;
  // void newAdventure() => _theAdventure = Adventure();

  int numberOfTurnsUntilEnd;
  bool adventureOver = false;
  double pctOver = 0.0;

  // the underscore means a variable is private
  double _var1;
  double _var2;
  double _var3;
  double _var4;

  // public getter methods so the variables can be accessed, but not modified directly, from outsie of this class
  double get var1 => _var1;
  double get var2 => _var2;
  double get var3 => _var3;
  double get var4 => _var4;

  // the constructor
  Adventure({this.numberOfTurnsUntilEnd}) {
    if (numberOfTurnsUntilEnd == null) {
      numberOfTurnsUntilEnd = 10;
    }
    _var1 = 0.5;
    _var2 = 0.5;
    _var3 = 0.5;
    _var4 = 0.5;
  }

  //variable modification is permitted through method calls
  void incrementVar1(num x) => _var1 += x;
  void incrementVar2(num x) => _var2 += x;
  void incrementVar3(num x) => _var3 += x;
  void incrementVar4(num x) => _var4 += x;
}
