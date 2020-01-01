// this class represents the state of the current game

class Adventure {
  int numberOfTurnsUntilEnd;
  bool adventureOver = false;
  double pctOver = 0.0;

  // the underscore means a variable is private
  int _var0;
  int _var1;
  int _var2;
  int _var3;

  // public getter methods
  int get var0 => _var0;
  int get var1 => _var1;
  int get var2 => _var2;
  int get var3 => _var3;

  bool get hasNegativeVar => _var0 < 0 || _var1 < 0 || _var2 < 0 || _var3 < 0;

  // Adventure constructor
  Adventure({this.numberOfTurnsUntilEnd}) {
    if (numberOfTurnsUntilEnd == null) {
      numberOfTurnsUntilEnd = 6;
    }
    _var0 = 50;
    _var1 = 50;
    _var2 = 50;
    _var3 = 50;
  }

  // methods to modify stat variables
  void incrementVar0(int x) => _var0 += x;
  void incrementVar1(int x) => _var1 += x;
  void incrementVar2(int x) => _var2 += x;
  void incrementVar3(int x) => _var3 += x;

  void incrementVar(int i, int x) {
    switch (i) {
      case 0:
        incrementVar0(x);
        break;
      case 1:
        incrementVar1(x);
        break;
      case 2:
        incrementVar2(x);
        break;
      case 3:
        incrementVar3(x);
        break;
    }
  }
}
