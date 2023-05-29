import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Page/auth/login_page.dart';
import 'package:myanimeapp/Providers/Page/auth/verification_email_page.dart';
import 'package:myanimeapp/components/button/authentication_button.dart';
import 'package:myanimeapp/components/message/authenticator_message.dart';
import 'package:myanimeapp/components/inputs/authentication_input.dart';
import 'package:myanimeapp/components/views/authentication_title.dart';
import 'package:provider/provider.dart';

import '../../../components/animations/lottie_overlay.dart';
import '../../Service/auth/provider/authenticator_provider.dart';
import '../../Service/auth/provider/coutdown_timer_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();
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
    final timer = Provider.of<TimerEmailVerification>(context, listen: false);
    final authenticator =
        Provider.of<AuthenticatorProvider>(context, listen: false);
    final loadingOverview = Provider.of<AuthenticatorProvider>(
      context,
    ).isLoading;
    if (loadingOverview == true) {
      Future.delayed(const Duration(milliseconds: 100)).then((value) {
        LottieOverlay.instance().show(context: context);
      });
    }
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
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
                    validatorInput: (value) {
                      if (value!.length < 3) {
                        return 'username at least 3 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  AuthenticationInput(
                    inputController: _phoneController,
                    inputIcon: Icons.phone_android_sharp,
                    hintText: 'PHONE (081)',
                    validatorInput: (value) {
                      if (value!.contains('081')) {
                        return null;
                      } else {
                        return 'phone number invalid';
                      }
                    },
                  ),
                  AuthenticationInput(
                    inputController: _emailController,
                    inputIcon: Icons.email_outlined,
                    hintText: 'EMAIL',
                    validatorInput: (input) {
                      if (input!.contains('@gmail') ||
                          input.contains('@mail') ||
                          input.contains('@yahoo')) {
                        return null;
                      } else {
                        return 'email invalid';
                      }
                    },
                  ),
                  AuthenticationInput(
                    inputController: _passwordController,
                    inputIcon: Icons.lock,
                    hintText: 'PASSWORD',
                    obsecured: true,
                    validatorInput: (value) {
                      if (value!.length < 7) {
                        return 'password at least 6 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  AuthenticationInput(
                    inputController: _passwordConfirmController,
                    inputIcon: Icons.lock,
                    hintText: 'CONFIRM PASSWORD',
                    obsecured: true,
                    validatorInput: (value) {
                      if (_passwordController.text !=
                          _passwordConfirmController.text) {
                        return 'password is not same';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthenticationButton(
                    title: 'SIGN UP',
                    callback: () {
                      if (!_key.currentState!.validate()) {
                        return;
                      }
                      authenticator
                          .signUp(
                              _emailController.text, _passwordController.text)
                          .then((_) async {
                        authenticator.verifyEmail();
                        await Future.delayed(const Duration(seconds: 1))
                            .then((_) {
                          LottieOverlay.instance().hide(context: context);
                          timer.timerCount();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EmailVerificationPage(),
                              ));
                        });
                      }).catchError((error) {
                        LottieOverlay.instance().hide(context: context);
                        AuthenticatorMessage.message(
                            context: context,
                            title: 'Error',
                            subtitle: error.toString(),
                            color: Colors.red);
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.white54)),
                      TextSpan(
                          text: "Sign In",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.amber),
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
    );
  }
}
