import 'package:flutter_screenutil/flutter_screenutil.dart';

import '';import 'package:flutter/material.dart';
import '../screens/screens.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context, HomeScreen.routeName);
                },
                icon: Icon(Icons.home_filled , color: Colors.white,)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                icon: Icon(Icons.shopping_cart,color: Colors.white,)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(Icons.person,color: Colors.white,)),
          ],
        ),
      ),
    );
  }
}