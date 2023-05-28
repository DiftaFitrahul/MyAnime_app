import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Service/auth/backend/authenticator.dart';

class AuthenticatorProvider extends ChangeNotifier {
  bool? isLoading;
  bool isVerifiedAccount = false;

  Future<void> signUp(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      await Authenticator.signUp(email: email, password: password);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      await Authenticator.signIn(email: email, password: password);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  void verifyEmail() async {
    await Authenticator.emailVerification();
  }

  void checkVerification() async {
    await Authenticator.checkEmailVerification();

    if (const Authenticator().emailVerified == true) {
      isVerifiedAccount = true;
      notifyListeners();
    } else {
      isVerifiedAccount = false;
      notifyListeners();
    }
  }
}
