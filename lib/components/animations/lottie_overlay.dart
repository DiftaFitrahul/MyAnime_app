import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myanimeapp/Providers/animes_provider.dart';
import 'package:provider/provider.dart';

class LottieOverlay {
  LottieOverlay._sharedInstance();
  static final LottieOverlay _instance = LottieOverlay._sharedInstance();
  factory LottieOverlay.instance() => _instance;

  Future<void> show({required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Lottie.asset('assets/lottie/loading_lottie.json',
              repeat: true, reverse: true);
        });
  }

  void hide({required BuildContext context}) {
    Navigator.pop(context);
  }
}
