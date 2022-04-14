import 'package:block_eccomerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:block_eccomerce_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String routeName = '/Cart_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Cart'),
        bottomNavigationBar: BottomAppBar(
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
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
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
                              state.cart.freeDeliveryString,
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
                        SizedBox(
                            height: 420.h,
                            child: ListView.builder(
                                itemCount: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .length,
                                itemBuilder: (context, index) =>
                                    CartProductCard(
                                      product: state.cart
                                          .productQuantity(state.cart.products)
                                          .keys
                                          .elementAt(index),
                                      quantity: state.cart
                                          .productQuantity(state.cart.products)
                                          .values
                                          .elementAt(index),
                                    ))),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SUBTOTAL',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text('\$${state.cart.subtotal}',
                                      style:
                                          Theme.of(context).textTheme.headline5)
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'DELIVERY FEE',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text('\$${state.cart.deliverFee}',
                                      style:
                                          Theme.of(context).textTheme.headline5)
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
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50)),
                            ),
                            Container(
                              width: ScreenUtil().screenWidth,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 5.h),
                              height: 50.h,
                              decoration:
                                  const BoxDecoration(color: Colors.black),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'TOTAL',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text('\$${state.cart.total}',
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
              );
            } else {
              return Center(
                child: const Text(error),
              );
            }
          },
        ));
  }
}
