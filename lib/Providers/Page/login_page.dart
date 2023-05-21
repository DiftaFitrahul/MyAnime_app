import 'package:flutter/material.dart';
import 'package:myanimeapp/components/inputs/authentication_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            Text('Please sign in to continue',
                style: TextStyle(color: Colors.white)),
            AuthenticationInput(),
            AuthenticationInput()
          ],
        ),
      ),
    );
  }
}
