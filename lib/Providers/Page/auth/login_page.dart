import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Page/auth/register_page.dart';
import 'package:myanimeapp/components/animations/lottie_animation.dart';
import 'package:myanimeapp/components/button/authentication_button.dart';
import 'package:myanimeapp/components/inputs/authentication_input.dart';
import 'package:myanimeapp/components/views/authentication_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                    child:
                        LottieAnimation(animation: 'assets/lottie/japan.json'),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AuthenticationTitle(
                        title: 'Login', subtitle: 'Please login to continue'),
                  ),
                  AuthenticationInput(
                    inputController: _emailController,
                    inputIcon: Icons.email_outlined,
                    hintText: 'EMAIL',
                    validatorInput: (value) {
                      if (value!.contains('@')) {
                        return null;
                      } else {
                        return 'invalid email';
                      }
                    },
                  ),
                  AuthenticationInput(
                    inputController: _passwordController,
                    inputIcon: Icons.lock,
                    hintText: 'PASSWORD',
                    obsecured: true,
                    validatorInput: (value) {
                      if (value!.length < 8) {
                        return 'password at least 8 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthenticationButton(
                    title: 'LOGIN',
                    callback: () {
                      if (!_key.currentState!.validate()) {
                        return;
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.amber.withOpacity(0.8),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.white54)),
                      TextSpan(
                          text: "Sign Up",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.amber),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                )))
                    ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
