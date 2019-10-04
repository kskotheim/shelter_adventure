import 'package:flutter/material.dart';
import 'package:shelter_adventure/components/adventure/adventure_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // The material app widget is the root of the application,
  // and is built once, when the app starts

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shelter Adventure',
      home: AdventurePage(),
    );
  }
}

