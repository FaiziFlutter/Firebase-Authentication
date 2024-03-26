import 'dart:async';

import 'package:firebase_project_1/ui/auth/login_screen.dart';
import 'package:firebase_project_1/ui/home/home_screen.dart';
import 'package:firebase_project_1/utils/variables.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  void isLogin() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return currentuser == null ? const LoginScreen() : const HomeScreen();
      }));
    });
  }
}
