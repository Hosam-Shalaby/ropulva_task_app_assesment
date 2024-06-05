import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant/colors.dart';

class TabBarItemAndroid extends StatelessWidget {
  final String title;

  const TabBarItemAndroid({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ConstantColors.black,
          fontSize: 13.sp,
          // fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
