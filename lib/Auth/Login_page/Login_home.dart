import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_app/Auth/widget/login_widgets.dart';

class LoginHomePage extends StatelessWidget {
  const LoginHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const blueColor = Color(0xFF2196F3); // Blue button & title
    const greenColor = Color(0xFF4CAF50); // Subtitle text

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Top Left Green Circle
            Positioned(
              top: -40.h,
              right: 170.w,
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 52, 192, 56),
                ),
              ),
            ),
            // Top Left Blue Circle
            Positioned(
              top: -130.h,
              left: -100.w,
              child: Container(
                width: 250.w,
                height: 250.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: blueColor,
                ),
              ),
            ),
            // Bottom Right Green Circle
            Positioned(
              bottom: -120.h,
              right: -100.w,
              child: Container(
                width: 220.w,
                height: 220.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: greenColor,
                ),
              ),
            ),

            // Main UI Form
            LoginWidgets(blueColor: blueColor, greenColor: greenColor),
          ],
        ),
      ),
    );
  }
}
