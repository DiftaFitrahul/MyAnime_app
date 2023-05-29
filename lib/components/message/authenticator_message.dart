import 'package:flutter/material.dart';

@immutable
class AuthenticatorMessage {
  const AuthenticatorMessage._();

  static void message(
      {required BuildContext context,
      required String title,
      required String subtitle,
      required Color color}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Stack(children: [
          Container(
            height: 90,
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
        ]),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
      ));
  }
}
