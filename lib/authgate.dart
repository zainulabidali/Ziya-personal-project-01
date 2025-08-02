import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_app/Auth/Login_page/Login_home.dart';
import 'package:personal_app/home/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // 🔄 Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // ❌ Error occurred
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(child: Text("Something went wrong")),
          );
        }

        // 👤 User is logged in
        if (snapshot.hasData) {
          return  HomeScreen(); // ✅ Change to your main page
        }

        // 🔐 User not logged in
        return const LoginHomePage();
      },
    );
  }
}
