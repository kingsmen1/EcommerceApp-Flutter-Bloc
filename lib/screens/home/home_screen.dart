import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName  = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Zero to  Unicorn'),
      bottomNavigationBar: const  CustomNavBar(),
      body:  CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          enlargeStrategy:CenterPageEnlargeStrategy.height,
          initialPage: 2,
          autoPlay: true,
        ),
        items: Category.categories.map((category) => HeroCarouselCard(category: category)).toList(),
      ),
    );
  }
}


