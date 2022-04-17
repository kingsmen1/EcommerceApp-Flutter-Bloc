import 'package:block_eccomerce_app/blocs/blocs.dart';
import 'package:block_eccomerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    if(state is CartLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is CartLoaded){
      return Column(
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
                      Text('\$${state.cart.subtotal}',
                          style: Theme.of(context).textTheme.headline5)
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
                      Text('\$${state.cart.deliverFee}',
                          style: Theme.of(context).textTheme.headline5)
                    ],
                  ),
                ],
              )),
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
                      Text('\$${state.cart.total}',
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
        ],
      );
    }
    else{
      return  error();
    }
  },
);
  }
}
