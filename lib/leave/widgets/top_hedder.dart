
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class top_hedding extends StatelessWidget {
  const top_hedding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/img/ziya_logo.png", // replace with actual logo path
          width: 40.w,
          height: 50.h,
        ),
        SizedBox(width: 5.w,),
       Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "Ziya Academy",
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    ),
    Text(
      "Key To Success",
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.green,
      ),
    ),
  ],
),
Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Payslip for month",
              style: TextStyle(fontSize: 12.sp),
            ),
            Text(
              "June 2025",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
