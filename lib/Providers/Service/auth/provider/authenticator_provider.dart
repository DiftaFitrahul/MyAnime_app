import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Service/auth/backend/authenticator.dart';

import '../user_info/user_info_storage.dart';

class AuthenticatorProvider extends ChangeNotifier {
  bool? isLoading;
  bool isVerifiedAccount = false;
  final _authenticator = const Authenticator();
  final UserInfoStorage _userInfoStorage = const UserInfoStorage();

  Future<void> signUp(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      await Authenticator.signUp(email: email, password: password);
      final userId = _authenticator.userId;
      if (userId != null && _authenticator.emailVerified == true) {
        await saveUserInfo(userId: userId);
      }
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
      final userId = _authenticator.userId;
      if (userId != null && _authenticator.emailVerified == true) {
        await saveUserInfo(userId: userId);
      }
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

  Future<String> resetPassword({required String email}) async {
    try {
      await Authenticator.resetPassword(email: email);
      return 'Succes send email';
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUserInfo({required String userId}) async {
    await _userInfoStorage.saveUserInfo(
        userId: userId,
        userName: _authenticator.username ?? '',
        email: _authenticator.email ?? '',
        image: _authenticator.photoUrl ?? '');
  }
}
