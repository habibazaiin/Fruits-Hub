import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/errors/exception.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

class FirebaseService extends DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String collectionPath,
      required Map<String, dynamic> data}) async {
    await firestore.collection(collectionPath).add(data);
  }

  @override
  Future<UserEntity> getUserData(
      {required String collectionPath, required String uid}) async {
    var user = await firestore.collection(collectionPath).doc(uid).get();
    return UserModel.fomJson(user.data()!);
  }
}
