import 'package:flutter/material.dart';
import 'package:block_eccomerce_app/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String routeName = '/Cart_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Cart'),
        bottomNavigationBar:BottomAppBar(
          child: Container(
            color: Colors.black,
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {},
                    child: Text(
                      'GO TO CHECKOUT',
                      style: Theme.of(context).textTheme.headline3,
                    ))
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
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
                  SizedBox(
                    height: 10.h,
                  ),
                  CartProductCard(product: Product.products[0]),
                  CartProductCard(product: Product.products[1]),
                  CartProductCard(product: Product.products[0]),
                  CartProductCard(product: Product.products[1]),
                ],
              ),
              Column(
                children: [
                  const Divider(thickness: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40.w, vertical: 10.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SUBTOTAL',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text('\$5.98',
                                style: Theme.of(context).textTheme.headline5)
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'DELIVERY FEE',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text('\$2.98',
                                style: Theme.of(context).textTheme.headline5)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: ScreenUtil().screenWidth,
                        height: 60.h,
                        decoration:
                            BoxDecoration(color: Colors.black.withAlpha(50)),
                      ),
                      Container(
                        width: ScreenUtil().screenWidth,
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 5.h),
                        height: 50.h,
                        decoration: const BoxDecoration(color: Colors.black),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'TOTAL',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                              Text('\$12.98',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
