import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';

class OrderSummaryProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const OrderSummaryProductCard({
    Key? key, required this.product, required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 8.0.h),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            height: 80,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Qty.$quantity ',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "\$ ${product.price}",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
