import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_app/Auth/Auth_service/authservice.dart';
import 'package:personal_app/Auth/Login_page/Login_home.dart';
import 'package:personal_app/home/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {}); // Update validation when password changes
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    String password = _passwordController.text;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Decorative Background Circles
            Positioned(
              top: -50,
              left: 50,
              child: _buildCircle(100, Colors.green),
            ),
            Positioned(
              top: -90,
              left: -80,
              child: _buildCircle(200, Colors.blue),
            ),
            Positioned(
              bottom: -100,
              right: -100,
              child: _buildCircle(200, Colors.green),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    _buildTitle(),
                    SizedBox(height: 25.h),

                    // Input Fields
                    _buildLabel("Full Name"),
                    _buildInputField(Icons.person, 'Full Name', controller: _nameController),

                    SizedBox(height: 15.h),
                    _buildLabel("Email"),
                    _buildInputField(Icons.email, 'Email', controller: _emailController),

                    SizedBox(height: 15.h),
                    _buildLabel("Mobile Number"),
                    _buildInputField(Icons.phone, 'Enter 10-digit mobile number', controller: _phoneController),

                    SizedBox(height: 15.h),
                    _buildLabel("Password"),
                    _buildInputField(Icons.lock, 'Password', isPassword: true, controller: _passwordController),

                    SizedBox(height: 11.h),
                    _buildValidationText("Minimum 8 characters", password.length >= 8),
                    _buildValidationText("At least 1 number", RegExp(r'[0-9]').hasMatch(password)),
                    _buildValidationText("At least 1 letter (A-Z or a-z)", RegExp(r'[A-Za-z]').hasMatch(password)),

                    SizedBox(height: 20.h),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        onPressed: _handleSignUp,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.black, fontSize: 14.sp),
                          children: [
                            TextSpan(
                              text: 'Log In', 
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Navigate to Login screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginHomePage(),)); // or use push()
            },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Input Field Builder
  Widget _buildInputField(IconData icon, String hint,
      {bool isPassword = false, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  // 🔹 Label
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
    );
  }

  // 🔹 Validation Text
  Widget _buildValidationText(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.close,
            color: isValid ? Colors.green : Colors.red,
            size: 16,
          ),
          SizedBox(width: 4.w),
          Text(
            text,
            style: TextStyle(
              color: isValid ? Colors.green : Colors.red,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Decorative Circle
  Widget _buildCircle(double size, Color color) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  // 🔹 Title
  Widget _buildTitle() {
    return Column(
      children: [
        Center(
          child: Text(
            'Ziya Attend',
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
        SizedBox(height: 7.h),
        Center(
          child: Text(
            'Create an account and enjoy all services',
            style: TextStyle(fontSize: 16.sp, color: Colors.green),
          ),
        ),
      ],
    );
  }

  // 🔹 Sign Up Button Handler
 void _handleSignUp() async {
  final email = _emailController.text.trim();
  final password = _passwordController.text.trim();

  final authService = AuthService();
  String? success = await authService.signUp(email: email, password: password);

  if (success != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("✅ Account created successfully")),
    );

    // Navigate to HomeScreen and replace current screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  HomeScreen()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("❌ Sign up failed")),
    );
  }
}

}
