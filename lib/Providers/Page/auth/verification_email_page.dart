import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Page/auth/register_page.dart';
import 'package:myanimeapp/Providers/Page/home_page.dart';
import 'package:myanimeapp/Providers/Service/auth/provider/coutdown_timer_provider.dart';
import 'package:myanimeapp/components/animations/lottie_animation.dart';
import 'package:myanimeapp/components/button/authentication_button.dart';
import 'package:myanimeapp/components/error/authenticator_error.dart';
import 'package:myanimeapp/components/views/authentication_title.dart';
import 'package:provider/provider.dart';

import '../../Service/auth/provider/authenticator_provider.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticator =
        Provider.of<AuthenticatorProvider>(context, listen: false);
    final emailVerified = Provider.of<AuthenticatorProvider>(context);
    final timer = Provider.of<TimerEmailVerification>(context);
    final timerFunction =
        Provider.of<TimerEmailVerification>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 40.0),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios_rounded,
                            color: Colors.white)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: AuthenticationTitle(
                      title: 'Verify your Email',
                      subtitle:
                          'check your email & click the link to activate your account'),
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: LottieAnimation(animation: 'assets/lottie/email.json'),
                ),
                const Spacer(),
                AuthenticationButton(
                    title: 'Continue',
                    callback: emailVerified.isVerifiedAccount
                        ? () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ));
                          }
                        : null),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 35),
                      child: TextButton(
                          onPressed: timer.emailVerification
                              ? null
                              : () {
                                  authenticator.verifyEmail();
                                  timerFunction.timerCount();
                                },
                          child: Text(
                              'Resend email ${timer.emailVerification ? timer.countdown.toString() : ''}',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: timer.emailVerification
                                      ? Colors.grey
                                      : Colors.amber))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 35),
                      child: TextButton(
                          onPressed: () async {
                            authenticator.checkVerification();
                            await Future.delayed(
                                    const Duration(milliseconds: 450))
                                .then((_) {
                              emailVerified.isVerifiedAccount
                                  ? AuthenticatorMessage.message(
                                      context: context,
                                      title: 'Succes',
                                      subtitle: 'Email is verified ',
                                      color: Colors.green)
                                  : AuthenticatorMessage.message(
                                      context: context,
                                      title: 'Error',
                                      subtitle: 'Email is not verified ',
                                      color: Colors.red);
                            });
                          },
                          child: const Text('Check verify',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.amber))),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
