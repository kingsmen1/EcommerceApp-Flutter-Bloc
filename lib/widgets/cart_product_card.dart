import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 8.0.h),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            height: 80.h,
            width: 100.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
              Text(
                '1',
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))
            ],
          )
        ],
      ),
    );
  }
}