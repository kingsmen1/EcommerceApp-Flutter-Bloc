import 'package:block_eccomerce_app/screens/cart/cart_screen.dart';
import 'package:block_eccomerce_app/screens/catalog/catalog_screen.dart';
import 'package:block_eccomerce_app/screens/checkout/checkout_screen.dart';
import 'package:block_eccomerce_app/screens/home/home_screen.dart';
import 'package:block_eccomerce_app/screens/product/products_screen.dart';
import 'package:block_eccomerce_app/screens/splash/splash_screen.dart';
import 'package:block_eccomerce_app/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart ';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (ctx) => const HomeScreen(),
  CartScreen.routeName:(ctx) => const CartScreen(),
  WishlistScreen.routeName:(ctx)=> const WishlistScreen(),
  ProductScreen.routeName:(ctx )=> const ProductScreen(),
  CatalogScreen.routeName:(ctx)=> const CatalogScreen(),
  SplashScreen.routeName:(ctx)=> const SplashScreen(),
  CheckOutScreen.routeName:(ctx)=> const CheckOutScreen(),
};
