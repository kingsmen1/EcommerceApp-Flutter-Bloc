import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTile extends StatelessWidget {
  final String title;
  const SectionTile({
    Key? key,required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:20.w ),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(title , style: Theme.of(context).textTheme.headline3,)),
    );
  }
}
