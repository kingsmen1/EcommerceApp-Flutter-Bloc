import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalCart extends StatefulWidget {
  const TotalCart({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalCart> createState() => _TotalCartState();
}

class _TotalCartState extends State<TotalCart> {
  // OverlayEntry? entry;

  // @override
  // void initState() {
  //   WidgetsBinding.instance?.addPostFrameCallback((_) => showOverlay());
  // }
  //
  // showOverlay() {
  //   final overLay = Overlay.of(context);
  //   final renderBox = context.findRenderObject() as RenderBox;
  //   final size = renderBox.size;
  //   entry = OverlayEntry(
  //       builder: (context) =>
  //           Positioned(width: size.width, child: buildOverlay()));
  //   overLay?.insert(entry!);
  // }
  //
  // Widget buildOverlay() => Material(
  //         child: Container(
  //       color: Colors.red,
  //       //height: 10,
  //     ));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: Column(
        children: [
          const Divider(thickness: 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SUBTOTAL',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text('\$5.98', style: Theme.of(context).textTheme.headline5)
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DELIVERY FEE',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text('\$2.98', style: Theme.of(context).textTheme.headline5)
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: ScreenUtil().screenWidth,
                height: 60.h,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              ),
              Container(
                width: ScreenUtil().screenWidth,
                margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                height: 50.h,
                decoration: const BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text('\$12.98',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white))
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: (){},
            child: Stack(
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: 60.h,
                  decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  height: 50.h,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child:Container(
                      height: 60.h,
                     // padding: EdgeInsets.symmetric(horizontal: 20.w , vertical: 20.h),
                      width: double.infinity,
                      color: Colors.black,
                      child: Center(child: Text('GO TO CHECKOUT' , style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),)),
                    )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
