import 'package:block_eccomerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{

  final String title;
  const CustomAppBar({
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.black,
        child:  Text(
          title,
          style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white)
        ),
      ),
      iconTheme:IconThemeData(color: Colors.black),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, WishlistScreen.routeName);
            },
            icon: Icon(
              Icons.favorite,
            ))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
