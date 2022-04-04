import 'package:block_eccomerce_app/config/routes.dart';
import 'package:block_eccomerce_app/config/them.dart';
import 'package:block_eccomerce_app/screens/home/home_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //initialRoute: HomeScreen.routeName,
      routes: routes,
      home:   HomeScreen(),
    );
  }
}




