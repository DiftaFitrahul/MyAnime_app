import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Service/auth/backend/authenticator.dart';

class AuthenticatorProvider extends ChangeNotifier {
  bool? isLoading;

  Future<void> signUp(String email, String password) async {
    try{
      isLoading = true;
      notifyListeners();
      await Authenticator.signUp(email: email, password: password);
      isLoading = false;
      notifyListeners();
    } catch(e) {
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
  }
}
