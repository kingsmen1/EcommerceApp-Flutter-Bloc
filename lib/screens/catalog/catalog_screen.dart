import 'package:flutter/material.dart';
import 'package:block_eccomerce_app/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  static String routeName = '/Catalog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Catalog'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
