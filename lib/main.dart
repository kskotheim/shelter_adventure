import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shelter_adventure/components/game/game_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // The material app widget is the root of the application,
  // and is built once, when the app starts

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shelter Adventure',
      home: GamePage(),
    );
  }
}

