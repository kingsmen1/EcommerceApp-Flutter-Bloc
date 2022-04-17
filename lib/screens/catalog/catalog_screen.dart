import 'package:block_eccomerce_app/blocs/blocs.dart';
import 'package:block_eccomerce_app/constants.dart';
import 'package:block_eccomerce_app/models/category_model.dart';
import 'package:block_eccomerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:block_eccomerce_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  static String routeName = '/Catalog';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Categoryy;
    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: CustomNavBar(screen: "/home_screen"),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return loading();
            }
            if (state is ProductLoaded) {
              final List<Product> categoryProducts = state.products
                  .where((element) => element.category == category.name)
                  .toList();
              return GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.0.h),
                  itemCount: categoryProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (ScreenUtil().screenWidth /
                              ScreenUtil().screenHeight) /
                          0.4),
                  itemBuilder: (ctx, index) {
                    return Center(
                        child: ProductCard(
                      product: categoryProducts[index],
                      widthFactor: 2.3,
                    ));
                  });
            } else {
              return error();
            }
          },
        )
        //,
        );
  }
}
