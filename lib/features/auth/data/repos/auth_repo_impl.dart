import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exception.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/firebase_service_auth.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseServiceAuth firebaseServiceAuth;
  AuthRepoImpl({required this.firebaseServiceAuth});
  @override
  Future<Either<Failure, UserEntity>> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    try {
      User user = await firebaseServiceAuth.createUserWithEmailAndPassword(
          emailAddress: email, password: password);
      UserModel userModel = UserModel.fromFirebaseUser(user);
      return Right(userModel);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('AuthRepoImpl - createAccount - Unexpected Error: ${e.toString()} & ecode ${e.hashCode}');
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.'));
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> signIn({required String email, required String password}) async {
    try {
      User user = await firebaseServiceAuth.signinWithEmailAndPassword(
          emailAddress: email, password: password);
      UserModel userModel = UserModel.fromFirebaseUser(user);
      return Right(userModel);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('AuthRepoImpl - signIn - Unexpected Error: ${e.toString()} & ecode ${e.hashCode}');
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.'));
    }

  }
}
