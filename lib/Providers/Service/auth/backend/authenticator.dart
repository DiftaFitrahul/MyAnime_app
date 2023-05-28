import 'package:firebase_auth/firebase_auth.dart';

class Authenticator {
  const Authenticator();
  String? get userId => FirebaseAuth.instance.currentUser?.uid;
  bool get isLogin => userId != null;
  String? get username => FirebaseAuth.instance.currentUser?.displayName;
  String? get email => FirebaseAuth.instance.currentUser?.email;
  String? get password => FirebaseAuth.instance.currentUser?.photoURL;
  bool? get emailVerified => FirebaseAuth.instance.currentUser?.emailVerified;

  static Future<void> signUp(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        rethrow;
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      }
    }
  }

  static Future<void> emailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> checkEmailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();
    } catch (e) {
      rethrow;
    }
  }
}
