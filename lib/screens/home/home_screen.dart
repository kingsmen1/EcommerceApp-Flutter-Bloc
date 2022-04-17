import 'package:block_eccomerce_app/blocs/category/category_bloc.dart';
import 'package:block_eccomerce_app/blocs/product/product_bloc.dart';
import 'package:block_eccomerce_app/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Zero to  Unicorn'),
        bottomNavigationBar: CustomNavBar(screen: '/home_screen'),
        body: ListView(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return loading();
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      initialPage: 2,
                      autoPlay: false,
                    ),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return error();
                }
              },
            ),
            const SectionTile(
              title: 'RECOMMENDED ',
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return loading();
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.products
                          .where((element) => element.isRecommended)
                          .toList());
                } else {
                  return error();
                }
              },
            ),
            const SectionTile(
              title: 'MOST POPULAR ',
            ),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductLoading) {
                return loading();
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((element) => element.isPopular)
                        .toList());
              } else {
                return error();
              }
            }),
          ],
        ));
  }
}
