import 'package:flutter/material.dart';
import 'package:block_eccomerce_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  static String routeName = '/Products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Products'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
