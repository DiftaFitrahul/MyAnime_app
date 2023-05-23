import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserInfoStorage {
  const UserInfoStorage();
  Future<void> saveUserInfo({
    required String userId,
    required String userName,
    required String email,
    required String image,
  }) async {
    try {
      final infoUser = await FirebaseFirestore.instance
          .collection('users')
          .where('userId', isEqualTo: userId)
          .limit(1)
          .get();
      if (infoUser.docs.isNotEmpty) {
        await infoUser.docs.first.reference.update({
          'userName' : userName,
          'email' : email,
          'image' : image,
        });
      }
    } catch (e) {}
  }
}
