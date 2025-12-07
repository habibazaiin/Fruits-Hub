import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createAccount(
      {required String name, required String email, required String password});

  Future<Either<Failure, UserEntity>> signIn(
      {required String email, required String password});

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future addUserData({required UserEntity user});

  Future saveUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String userId});

  // Future<Either<Failure, UserEntity>> signInWithFacebook();
}
