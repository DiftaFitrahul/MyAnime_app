import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myanimeapp/Providers/Page/auth/register_page.dart';
import 'package:myanimeapp/components/animations/lottie_animation.dart';
import 'package:myanimeapp/components/button/authentication_button.dart';
import 'package:myanimeapp/components/views/authentication_title.dart';
import 'package:provider/provider.dart';

import '../../Service/auth/provider/authenticator_provider.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            )),
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
                AuthenticationButton(title: 'Continue', callback: () {}),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 35),
                  child: TextButton(
                      onPressed: () {
                        Provider.of<AuthenticatorProvider>(context,
                                listen: false)
                            .verifyEmail();
                        Provider.of<AuthenticatorProvider>(context,
                                listen: false)
                            .checkVerification();
                      },
                      child: const Text('Resend email',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.amber))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
