import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarLeaveHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarLeaveHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.blue,
            child: Image.asset(
              "assets/img/ziya_logo.png", // replace with actual logo path
              width: 40.w,
              height: 40.h,
            ),
          ),
          SizedBox(width: 12.w),

          // 🔍 Search Box
          Expanded(
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),

          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                size: 18.sp,
                color: Colors.white,
              ),
              onPressed: () {},
              splashRadius: 20.r,
            ),
          ),
          SizedBox(width: 12.w),

          // 👤 Profile Image in circular avatar
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage(
                'assets/img/usthad.5.jpg',
              ),
              backgroundColor: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
