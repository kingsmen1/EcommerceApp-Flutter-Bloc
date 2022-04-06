import 'package:block_eccomerce_app/screens/cart/cart_screen.dart';
import 'package:block_eccomerce_app/screens/catalog/catalog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';

class HeroCarouselCard extends StatelessWidget {

  final Product? product;
  final Category? category;
  const HeroCarouselCard({Key? key, this.category, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(product == null){
          Navigator.pushNamed(context, CatalogScreen.routeName , arguments:  category);
        }
      },
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: 5.0.w , vertical: 20.h),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(product==null? category!.imageUrl : product!.imageUrl, fit: BoxFit.cover, width: 1000.0.w),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:   EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 20.0.w),
                    child: Text(
                        product==null? category!.name :'',
                        style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white)
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}