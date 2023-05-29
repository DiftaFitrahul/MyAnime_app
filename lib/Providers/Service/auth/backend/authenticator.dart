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
        if (FirebaseAuth.instance.currentUser?.emailVerified == false) {
          throw ("The account already exists and didn't verified, please login and verify the account.");
        } else {
          throw ("The account already exists for that email");
        }
      }
    }
  }

  static Future<void> signIn(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided for that user.');
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

  static Future<void> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'User not found for that email.';
      } else {
        rethrow;
      }
    }
  }
}
