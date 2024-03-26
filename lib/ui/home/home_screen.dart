import 'dart:async';

import 'package:firebase_project_1/utils/variables.dart';
import 'package:flutter/material.dart';

import '../auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Home"),
          ElevatedButton(
              onPressed: () async {
                await auth.signOut();
                Timer(const Duration(seconds: 1), () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                });
              },
              child: const Text("Logout"))
        ],
      ),
    );
  }
}
