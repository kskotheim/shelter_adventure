// this class represents the state of the current game

class Adventure {
  // static Adventure _theAdventure = Adventure();
  // Adventure get theAdventure => _theAdventure;
  // void newAdventure() => _theAdventure = Adventure();

  int numberOfTurnsUntilEnd;
  bool adventureOver = false;
  double pctOver = 0.0;

  // the underscore means a variable is private
  int _var1;
  int _var2;
  int _var3;
  int _var4;

  // public getter methods so the variables can be accessed, but not modified directly, from outsie of this class
  int get var1 => _var1;
  int get var2 => _var2;
  int get var3 => _var3;
  int get var4 => _var4;

  // the constructor
  Adventure({this.numberOfTurnsUntilEnd}) {
    if (numberOfTurnsUntilEnd == null) {
      numberOfTurnsUntilEnd = 10;
    }
    _var1 = 50;
    _var2 = 50;
    _var3 = 50;
    _var4 = 50;
  }

  //variable modification is permitted through method calls
  void incrementVar1(num x) => _var1 += x;
  void incrementVar2(num x) => _var2 += x;
  void incrementVar3(num x) => _var3 += x;
  void incrementVar4(num x) => _var4 += x;
}
