import 'package:flutter/material.dart';

class AuthenticationTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthenticationTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          const SizedBox(height: 15),
          Text(subtitle,
              style: const TextStyle(color: Colors.white54, fontSize: 15)),
        ],
      ),
    );
  }
}
