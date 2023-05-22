import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieOverlay {
  LottieOverlay._sharedInstance();
  static final LottieOverlay _instance = LottieOverlay._sharedInstance();
  factory LottieOverlay.instance() => _instance;

  Future<void> show({required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Lottie.asset('assets/lottie/loading_2.json',
              repeat: true, reverse: true);
        });
  }

  void hide({required BuildContext context}) {
    Navigator.pop(context);
  }
}
