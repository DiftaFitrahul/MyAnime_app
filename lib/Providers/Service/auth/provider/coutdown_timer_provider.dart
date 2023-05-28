import 'dart:async';

import 'package:flutter/material.dart';

class TimerEmailVerification extends ChangeNotifier {
  int countdown = 60;
  bool emailVerification = true;

  void timerCount() async {
    for (int i = 0; i < 59; i++) {
      countdown--;
      if (i == 0) emailVerification = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 1));
      if (countdown == 1) {
        await Future.delayed(const Duration(milliseconds: 200));
        emailVerification = false;
        notifyListeners();
        countdown = 60;
      }
    }
  }
}
