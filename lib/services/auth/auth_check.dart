import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_order/pages/home_page.dart';
import 'package:food_order/services/auth/login_or_register.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); 
        }
        if (snapshot.hasData) {
          return const HomePage(); // User is signed in
        } else {
          return const LoginOrRegister(); // User is not signed in
        }
      },
    );
  }
}
