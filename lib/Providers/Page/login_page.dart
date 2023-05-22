import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myanimeapp/components/button/authentication_button.dart';
import 'package:myanimeapp/components/inputs/authentication_input.dart';
import 'package:myanimeapp/components/views/authentication_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _key.currentState!.dispose();
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 37),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: AuthenticationTitle(
                          title: 'Login', subtitle: 'Please login to continue'),
                    ),
                    AuthenticationInput(
                        inputController: _emailController,
                        inputIcon: Icons.email_outlined,
                        hintText: 'EMAIL'),
                    AuthenticationInput(
                      inputController: _passwordController,
                      inputIcon: Icons.lock,
                      hintText: 'PASSWORD',
                      obsecured: true,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    AuthenticationButton(
                      title: 'LOGIN',
                      callback: () {},
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
                    const Spacer(),
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
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ])),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
