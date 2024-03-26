import 'dart:async';

import 'package:firebase_project_1/ui/auth/signup_screen.dart';
import 'package:firebase_project_1/utils/toast_handler.dart';
import 'package:firebase_project_1/utils/validation.dart';
import 'package:firebase_project_1/utils/variables.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/text.dart';
import '../../widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFieldCustom(
                  controller: emailController,
                  hintText: 'email',
                  keyboardtype: TextInputType.emailAddress,
                  validator: (value) => validateEmail(value)),
              TextFormFieldCustom(
                  controller: passwordController,
                  hintText: 'password',
                  keyboardtype: TextInputType.text,
                  obscuretext: true,
                  validator: (value) => validatePassword(value)),
              const SizedBox(
                height: 20,
              ),
              Button(
                text: 'Login',
                textcolor: whiteColor,
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    _logIn();
                  }
                },
              ),
              Row(
                children: [
                  const TextLine(text: "Don't have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpScreen();
                        }));
                      },
                      child: const Text('Sign Up'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _logIn() async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );

      if (userCredential.user != null) {
        final uid = userCredential.user!.uid;

        // Save UID to SharedPreferences
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('uid', uid);

        showToast('Sign In Successful');
      }
    } catch (error) {
      // Handle sign-in errors
      print('Sign in failed: $error');
      showToast('Sign In Failed');
    }
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }
}
