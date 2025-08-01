import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_app/Auth/Auth_service/authservice.dart';
import 'package:personal_app/Auth/Sign_up/sign_up_Page.dart';
import 'package:personal_app/home/home_screen.dart';

class LoginWidgets extends StatefulWidget {
  const LoginWidgets({
    super.key,
    required this.blueColor,
    required this.greenColor,
  });

  final Color blueColor;
  final Color greenColor;

  @override
  State<LoginWidgets> createState() => _LoginWidgetsState();
}

class _LoginWidgetsState extends State<LoginWidgets> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  bool _isLoading = false;
  void _handleLogin() async {
    setState(() => _isLoading = true);

    final error = await _authService.login(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (error == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ Login successful!')),
      );

      // Navigate to HomeScreen and prevent going back to login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 120.h),
          Text(
            'Ziya Attend',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: widget.blueColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Smart Attendance Maintainer',
            style: TextStyle(
              fontSize: 16.sp,
              color: widget.greenColor,
            ),
          ),
          SizedBox(height: 40.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: const Icon(Icons.visibility_off),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text('Remember me', style: TextStyle(fontSize: 13.sp)),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text('Forget Password?',
                    style: TextStyle(color: widget.blueColor, fontSize: 13.sp)),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: _isLoading ? null : _handleLogin,
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text('Log In',
                      style: TextStyle(fontSize: 18.sp, color: Colors.white)),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have account? ", style: TextStyle(fontSize: 13.sp)),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: Text("Sign Up",
                      style: TextStyle(
                          color: widget.blueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp))),
            ],
          ),
          SizedBox(height: 120.h),
        ],
      ),
    );
  }
}
