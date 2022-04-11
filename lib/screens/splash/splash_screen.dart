import 'dart:async';

import 'package:block_eccomerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splahscreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => Navigator.popAndPushNamed(context, HomeScreen.routeName));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 125.w,
              height: 125.h,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Text(
                'Zero To Unicorn',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
