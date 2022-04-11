import 'package:block_eccomerce_app/screens/cart/cart_screen.dart';
import 'package:block_eccomerce_app/screens/catalog/catalog_screen.dart';
import 'package:block_eccomerce_app/screens/home/home_screen.dart';
import 'package:block_eccomerce_app/screens/product/products_screen.dart';
import 'package:block_eccomerce_app/screens/splash/splash_screen.dart';
import 'package:block_eccomerce_app/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart ';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (ctx) => HomeScreen(),
  CartScreen.routeName:(ctx) => CartScreen(),
  WishlistScreen.routeName:(ctx)=> WishlistScreen(),
  ProductScreen.routeName:(ctx )=> ProductScreen(),
  CatalogScreen.routeName:(ctx)=> CatalogScreen(),
  SplashScreen.routeName:(ctx)=> SplashScreen(),
};
