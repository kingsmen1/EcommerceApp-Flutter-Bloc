import 'package:block_eccomerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:block_eccomerce_app/config/routes.dart';
import 'package:block_eccomerce_app/config/theme.dart';
import 'package:block_eccomerce_app/screens/home/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390 ,844),
      builder:()=> MultiBlocProvider(
        providers: [BlocProvider(create: (_)=> WishlistBloc()..add(LoadWishList()))],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          //initialRoute: HomeScreen.routeName,
          routes: routes,
          home:   HomeScreen(),
        ),
      ),
    );
  }
}




