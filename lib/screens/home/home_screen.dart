import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName  = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Zero to  Unicorn'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}