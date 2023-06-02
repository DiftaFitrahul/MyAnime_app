import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:myanimeapp/Providers/Service/auth/user_info/user_info_payload.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();
  Future<bool> saveUserInfo({
    required String userId,
    required String userName,
    required String email,
    required String image,
  }) async {
    try {
      // first check if the user is already registered
      final infoUser = await FirebaseFirestore.instance
          .collection('users')
          .where('userId', isEqualTo: userId)
          .limit(1)
          .get();
      //check is user is not empty
      if (infoUser.docs.isNotEmpty) {
        await infoUser.docs.first.reference.update({
          'userName': userName,
          'email': email,
          'image': image,
        });
        return true;
      }

      final payload = UserInfoPayload(
          userId: userId, userName: userName, email: email, image: image);
      await FirebaseFirestore.instance.collection('users').add(payload);
      return true;
    } catch (e) {
      return false;
    }
  }
}
