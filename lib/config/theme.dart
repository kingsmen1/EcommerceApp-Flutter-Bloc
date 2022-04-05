import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),

  );
}

TextTheme textTheme() {
  return  TextTheme(
    headline1: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),headline2: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),headline3: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),headline4: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),headline5: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),headline6: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),bodyText1: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),bodyText2: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),

  );
}