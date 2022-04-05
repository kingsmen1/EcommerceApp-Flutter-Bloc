import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  const ProductCard({
    Key? key,required this.product, required this.widthFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return Stack(
      children: [
        Container(
          width:widthValue,
          height: 150.h,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 60.h,
            //left: 5.w,
            child: Container(
              width:widthValue,
              height: 80.h,
              decoration:
              BoxDecoration(color: Colors.black.withAlpha(50)),
            )),
        Positioned(
          top: 65.h,
          left: 5.w,
          child: Container(
            width: widthValue - 10,
            height: 70.h,
            decoration: const BoxDecoration(color: Colors.black),
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          "\$${product.price}",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}