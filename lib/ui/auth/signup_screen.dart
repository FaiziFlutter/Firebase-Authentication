import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project_1/utils/firebase_exception.dart';
import 'package:firebase_project_1/utils/toast_handler.dart';
import 'package:firebase_project_1/utils/validation.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/variables.dart';
import '../../widgets/button.dart';
import '../../widgets/text.dart';
import '../../widgets/textfield.dart';
import '../home/home_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

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
        title: const Text('Sign up'),
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
              isLoading
                  ? const CircularProgressIndicator()
                  : Button(
                      text: 'Sign up',
                      textcolor: whiteColor,
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          _signup();
                        }
                      },
                    ),
              Row(
                children: [
                  const TextLine(text: "Already have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ));
                      },
                      child: const Text('Login'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signup() async {
    try {
      setState(() {
        isLoading = true;
      });
      final user = await auth.createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString());
      setState(() {
        isLoading = false;
      });
      showToast("signup successfully");
      clear();
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }));
      });
    } on FirebaseAuthException catch (e) {
      final errror = getException(e.code);
      showToast(errror, iserror: true);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showToast("somting went wrong ");
    }
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }
}
