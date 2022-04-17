import 'package:block_eccomerce_app/blocs/blocs.dart';
import 'package:block_eccomerce_app/blocs/cart/cart_bloc.dart';
import 'package:block_eccomerce_app/screens/product/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routeName,
            arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue,
            height: 150.h,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 60.h,
              left: leftPosition,
              child: Container(
                width: widthValue - 5 - leftPosition,
                height: 80.h,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              )),
          Positioned(
            top: 65.h,
            left: leftPosition + 5.w,
            child: Container(
              width: widthValue - 15 - leftPosition,
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
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return Expanded(
                            child:  Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(AddProduct(product));
                                  },
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                  )));
                        } else {
                          return Center(
                            child: error(),
                          );
                        }
                      },
                    ),
                    isWishList
                        ? Expanded(
                            child: IconButton(
                                onPressed: () {
                                  context
                                      .read<WishlistBloc>()
                                      .add(RemoveProductFromWishList(product));
                                  const snackBar = SnackBar(
                                      content:
                                          Text('Removed from your Wishlist'),
                                      duration: Duration(milliseconds: 300));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )))
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
