import 'dart:collection';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserInfoPayload extends MapView<String, dynamic> {
   UserInfoPayload({
    required String userId,
    required String userName,
    required String email,
    required String image,
  }) : super({
    'userId' : userId,
    'userName' : userName,
    'email' : email,
    'image' : image,
  });
}