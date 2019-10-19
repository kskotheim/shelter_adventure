import 'package:flutter/material.dart';


class Style {

  // main scaffold background color
  static final Color backgroundColor = Colors.lightBlueAccent.shade100;

  // color of progress bar
  static final Color progressColor = Colors.green.shade700;

  // stat widget style
  static final EdgeInsetsGeometry statWidgetPadding = EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 20.0);
  static final BoxDecoration statWidgetDecoration = BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.white);

  // large and small text style
  static final TextStyle titleTextStyleBold = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  static final TextStyle subTitleTextStyle = TextStyle(fontSize: 20.0);
  static final TextStyle subTitleTextStyleGreen = TextStyle(fontSize: 20.0, color: Colors.green);
  static final TextStyle subTitleTextStyleRed = TextStyle(fontSize: 20.0, color: Colors.red);
  static final TextStyle descriptionTextStyle = TextStyle(fontSize: 14.0);

}