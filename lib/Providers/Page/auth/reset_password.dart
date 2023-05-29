import 'package:flutter/material.dart';
import 'package:myanimeapp/components/button/authentication_button.dart';
import 'package:myanimeapp/components/inputs/authentication_input.dart';
import 'package:myanimeapp/components/message/authenticator_message.dart';
import 'package:myanimeapp/components/views/authentication_title.dart';
import 'package:provider/provider.dart';

import '../../Service/auth/provider/authenticator_provider.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailResetPassword = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailResetPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authenticator = Provider.of<AuthenticatorProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 23.0, vertical: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    )),
                const AuthenticationTitle(
                    title: 'Reset Password',
                    subtitle:
                        'Enter your email and we will send you a password link'),
                AuthenticationInput(
                    inputController: _emailResetPassword,
                    inputIcon: Icons.email_outlined,
                    hintText: 'EMAIL',
                    inputBorder: Border.all(color: Colors.amber, width: 2),
                    validatorInput: (input) {
                      if (input!.contains('@gmail') ||
                          input.contains('@mail') ||
                          input.contains('@yahoo')) {
                        return null;
                      } else {
                        return 'invalid email';
                      }
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Align(
                    alignment: Alignment.center,
                    child: AuthenticationButton(
                        title: 'Reset Password',
                        callback: () {
                          if (!_key.currentState!.validate()) {
                            return;
                          }
                          authenticator
                              .resetPassword(email: _emailResetPassword.text)
                              .then((message) {
                            AuthenticatorMessage.message(
                                context: context,
                                title: 'Succes',
                                subtitle: message,
                                color: Colors.green);
                          }).catchError((error) {
                            AuthenticatorMessage.message(
                                context: context,
                                title: 'Error',
                                subtitle: error.toString(),
                                color: Colors.red);
                          });
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
