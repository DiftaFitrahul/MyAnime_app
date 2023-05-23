import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Page/login_page.dart';
import 'package:myanimeapp/components/button/authentication_button.dart';
import 'package:myanimeapp/components/inputs/authentication_input.dart';
import 'package:myanimeapp/components/views/authentication_title.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
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
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage())),
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: AuthenticationTitle(
                        title: 'Create Account',
                        subtitle: 'Please fill the input below here',
                      ),
                    ),
                    AuthenticationInput(
                      inputController: _nameController,
                      inputIcon: Icons.person_2_outlined,
                      hintText: 'FULL NAME',
                    ),
                    AuthenticationInput(
                      inputController: _phoneController,
                      inputIcon: Icons.phone_android_sharp,
                      hintText: 'PHONE',
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
                    AuthenticationInput(
                      inputController: _passwordConfirmController,
                      inputIcon: Icons.lock,
                      hintText: 'CONFIRM PASSWORD',
                      obsecured: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthenticationButton(
                      title: 'SIGN UP',
                      callback: () {},
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.white54)),
                        TextSpan(
                            text: "Sign In",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  )))
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
