import 'package:block_eccomerce_app/blocs/blocs.dart';
import 'package:block_eccomerce_app/constants.dart';
import 'package:block_eccomerce_app/models/models.dart';
import 'package:block_eccomerce_app/widgets/custom_appbar.dart';
import 'package:block_eccomerce_app/widgets/custom_navbar.dart';
import 'package:block_eccomerce_app/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/widgets.dart';

class OrderConfirmation extends StatelessWidget {
  static String routeName = '/Order Confirmation';

  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(
        title: 'Order Confirmation',
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  height: 300.h,
                ),
                Positioned(
                    top: 125.h,
                    left: (MediaQuery.of(context).size.width - 100) / 2,
                    child: SvgPicture.asset('assets/svg/garlands.svg')),
                Positioned(
                  top: 250.h,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Your Order is Completed!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return loading();
                }
                if (state is CartLoaded) {
                  return Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Massimo,',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Thank you for purchasing on Zero To Unicorn.',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'ORDER CODE: #k321-ekd3',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        OrderSummary(),
                        SizedBox(height: 20.h),
                        Text(
                          'ORDER DETAILS',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const Divider(thickness: 2),
                        SizedBox(height: 5.h),
                        ListView.builder(
                            itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return OrderSummaryProductCard(
                                product: state.cart.products[index],
                                quantity: state.cart.productQuantity(state.cart.products)
                                    .values
                                    .elementAt(index),
                              );
                            }),
                      ],
                    ),
                  );
                } else {
                  return error();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
