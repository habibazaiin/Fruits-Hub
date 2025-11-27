import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData({required String collectionPath, required Map<String, dynamic> data, String ? documentId});
  Future<Map<String, dynamic>> getData({required String collectionPath, required String documentId});
  Future<bool> doucumentExists({required String collectionPath, required String documentId});
}