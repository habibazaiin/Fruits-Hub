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
    try {
      await firestore
          .collection(collectionPath)
          .add(data);
    } catch (e) {
      log('FirebaseService - addData - Unexpected Error: ${e.toString()} & ecode ${e.hashCode}');
      throw CustomException('حدث خطأ غير متوقع أثناء إضافة البيانات.');
    }
  }
  
}