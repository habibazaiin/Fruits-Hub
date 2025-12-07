import 'dart:convert';

import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var userDataString = Prefs.getString(kUserDataKey);
  if (userDataString != null) {
    var userDataJson = const JsonDecoder().convert(userDataString);
    return UserModel.fomJson(userDataJson);
  } else {
    throw Exception('No user data found in preferences');
  }
}