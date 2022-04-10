import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:block_eccomerce_app/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../models/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String routeName = '/Cart_screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      bottomNavigationBar: const BottomAppBar(child: TotalCart()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StickyHeader(
                  header: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add \$20.0 for FREE delivery',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: const RoundedRectangleBorder(),
                              primary: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: Text(
                              "Add More Items",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  content: Column(
                    children: [
                      CartProductCard(product: Product.products[1]),
                      CartProductCard(product: Product.products[2]),
                      CartProductCard(product: Product.products[3]),
                      CartProductCard(product: Product.products[4]),
                      CartProductCard(product: Product.products[5]),
                      CartProductCard(product: Product.products[6]),
                      CartProductCard(product: Product.products[7]),
                      CartProductCard(product: Product.products[8]),
                      CartProductCard(product: Product.products[9]),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
