import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData({required String collectionPath, required Map<String, dynamic> data});
  Future<UserEntity> getUserData({required String collectionPath, required String uid});
}