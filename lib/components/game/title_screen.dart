
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_adventure/components/game/game_logic.dart';
import 'package:shelter_adventure/util/style.dart';

class TitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameLogic gameLogic = Provider.of<GameLogic>(context);

    final menuOptions = <Widget>[
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Shelter Adventure', style: Style.titleTextStyleBold,),
        ],
      ),
      FlatButton(
        child: Text('New Game', style: Style.subTitleTextStyle,),
        onPressed: gameLogic.showGameScreen,
      ),
      FlatButton(
        child: Text('Inventory', style: Style.subTitleTextStyle,),
        onPressed: gameLogic.showInventory,
      ),
      FlatButton(
        child: Text('Challenges', style: Style.subTitleTextStyle,),
        onPressed: gameLogic.showChallenges,
      ),
      FlatButton(
        child: Text('Shop', style: Style.subTitleTextStyle,),
        onPressed: gameLogic.showShop,
      ),
    ];

    final firstGameOptions = <Widget>[
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Shelter Adventure', style: Style.titleTextStyleBold,),
        ],
      ),
      FlatButton(
        child: Text('New Game', style: Style.subTitleTextStyle,),
        onPressed: gameLogic.showGameScreen,
      ),
      Text('Inventory', style: Style.subTitleTextStyleDisabled,),
      Text('Challenges', style: Style.subTitleTextStyleDisabled,),
      Text('Shop', style: Style.subTitleTextStyleDisabled,),
    ];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: gameLogic.isFirstGame ? firstGameOptions : menuOptions
        ),
      ),
    );
  }
}
