import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Page/auth/register_page.dart';
import 'package:myanimeapp/Providers/Page/auth/reset_password.dart';
import 'package:myanimeapp/Providers/Page/auth/verification_email_page.dart';
import 'package:myanimeapp/Providers/Page/home_page.dart';
import 'package:myanimeapp/Providers/Service/auth/backend/authenticator.dart';
import 'package:myanimeapp/components/animations/lottie_animation.dart';
import 'package:myanimeapp/components/button/authentication_button.dart';
import 'package:myanimeapp/components/inputs/authentication_input.dart';
import 'package:myanimeapp/components/views/authentication_title.dart';
import 'package:provider/provider.dart';

import '../../../components/animations/lottie_overlay.dart';
import '../../../components/message/authenticator_message.dart';
import '../../Service/auth/provider/authenticator_provider.dart';

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
    final isVerified = const Authenticator().emailVerified;
    final authenticatorProvider =
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
                      if (value!.contains('@gmail') ||
                          value.contains('@mail') ||
                          value.contains('@yahoo')) {
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
                      if (value!.length < 7) {
                        return 'password at least 6 characters';
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
                      authenticatorProvider
                          .signIn(
                              _emailController.text, _passwordController.text)
                          .then((_) async {
                        await Future.delayed(const Duration(seconds: 1))
                            .then((_) {
                          LottieOverlay.instance().hide(context: context);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => isVerified!
                                ? const HomePage()
                                : const EmailVerificationPage(),
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
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordPage(),
                        )),
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
