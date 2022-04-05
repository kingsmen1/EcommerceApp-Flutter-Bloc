import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';
import 'widgets.dart';


class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key,required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.h,
      child: ListView.builder(
        padding:  EdgeInsets.symmetric(
          horizontal: 20.0.w,
          vertical: 10.0.h,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: products.length, itemBuilder:(ctx, index){
        return Padding(
          padding:  EdgeInsets.only(right: 5.0.w),
          child: ProductCard(product: products[index]),
        );
      },),
    );
  }
}