import 'package:flutter/material.dart';
import 'package:block_eccomerce_app/widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  static String routeName = '/Whishlist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Whishlist'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
