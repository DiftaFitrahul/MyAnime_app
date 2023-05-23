import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  final String animation;
  const LottieAnimation({super.key, required this.animation,});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(animation, repeat: true);
  }
}
