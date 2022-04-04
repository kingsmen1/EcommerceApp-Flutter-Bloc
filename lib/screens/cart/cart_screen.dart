import 'package:flutter/material.dart';
import 'package:block_eccomerce_app/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String routeName = '/Cart_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
