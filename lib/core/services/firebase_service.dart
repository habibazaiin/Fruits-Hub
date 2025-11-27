import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/errors/exception.dart';
import 'package:fruits_hub/core/services/database_service.dart';

class FirebaseService extends DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String collectionPath,
      required Map<String, dynamic> data}) async {
    await firestore.collection(collectionPath).add(data);
  }
}
