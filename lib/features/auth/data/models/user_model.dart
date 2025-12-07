import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.name});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
    );

  }
  factory UserModel.fomJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }

  factory UserModel.fromUserEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      email: userEntity.email,
      name: userEntity.name,
    );
  }

  toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }
}
