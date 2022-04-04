import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),

  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),headline2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),headline3: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),headline4: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),headline5: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),headline6: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),bodyText1: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),bodyText2: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),

  );
}