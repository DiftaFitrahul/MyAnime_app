import 'dart:async';

import 'package:flutter/material.dart';



class TimerEmailVerification extends ChangeNotifier {
  Timer? timer;
  int start = 30;

  Future<void> timerStart() async {
    timer = Timer.periodic(await Future.delayed(const Duration(seconds: 1)),
        (timer) {
      if (start == 0) {
        timer.cancel();
      } else {
        start--;
        notifyListeners();
      }
    });
  }


}
