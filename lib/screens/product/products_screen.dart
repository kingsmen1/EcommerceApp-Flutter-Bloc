import 'package:block_eccomerce_app/blocs/cart/cart_bloc.dart';
import 'package:block_eccomerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:block_eccomerce_app/models/models.dart';
import 'package:block_eccomerce_app/screens/cart/cart_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:block_eccomerce_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  static String routeName = '/Products';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.black,
          height: 70.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        context
                            .read<WishlistBloc>()
                            .add(AddProductToWishList(product));
                        const snackBar = SnackBar(
                          content: Text('Added to your Wishlist'),
                          duration: Duration(milliseconds: 300),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ));
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        context.read<CartBloc>().add(AddProduct(product));
                            Navigator.pushNamed(context, CartScreen.routeName);
                      },
                      child: Text(
                        'Add To Cart',
                        style: Theme.of(context).textTheme.headline3,
                      ));
                },
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              initialPage: 2,
              autoPlay: true,
            ),
            items: [
              HeroCarouselCard(
                product: product,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Stack(
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: 60.h,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: EdgeInsets.all(5.0.w),
                  width: ScreenUtil().screenWidth - 10,
                  height: 50.h,
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          "${product.price}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    'At vero eos et accusamus et iusto odio dignissimos ducimus quiblanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quasmolestias excepturi sint occaecati cupiditate non provident,similique sunt in culpa qui officia deserunt mollitia animi, idest laborum et dolorum fuga.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    'At vero eos et accusamus et iusto odio dignissimos ducimus quiblanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quasmolestias excepturi sint occaecati cupiditate non provident,similique sunt in culpa qui officia deserunt mollitia animi, idest laborum et dolorum fuga.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
