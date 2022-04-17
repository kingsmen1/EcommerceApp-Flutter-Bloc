import 'package:block_eccomerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:block_eccomerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:block_eccomerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:block_eccomerce_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  static String routeName = '/Whishlist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar:  CustomNavBar(screen: '/home_screen'),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if(state is WishlistLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
           if (state is WishlistLoaded){
             return GridView.builder(
                 padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.0.h),
                 itemCount: state.wishList.products.length,
                 gridDelegate:
                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
                     childAspectRatio: (ScreenUtil().screenWidth /
                         ScreenUtil().screenHeight) / 0.20),
                 itemBuilder: (ctx, index) {
                   return Center(child: ProductCard(
                     product: state.wishList.products[index], widthFactor: 1.1,
                     leftPosition: 100, isWishList: true,
                   ));
                 });
          } else{
             return error();
           }
        },
      ),
    );
  }
}
