import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exception.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/helper_functions/custom_snack_bar.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_service_auth.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseServiceAuth firebaseServiceAuth;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseServiceAuth});

  User? user;
  @override
  Future<Either<Failure, UserEntity>> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    try {
      user = await firebaseServiceAuth.createUserWithEmailAndPassword(
          emailAddress: email, password: password);
      UserEntity userEntity =
          UserEntity(id: user!.uid, email: email, name: name);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        firebaseServiceAuth.deleteUser();
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        firebaseServiceAuth.deleteUser();
      }
      log('AuthRepoImpl - createAccount - Unexpected Error: ${e.toString()} & ecode ${e.hashCode}');
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(
      {required String email, required String password}) async {
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

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseServiceAuth.signInWithGoogle();

      UserModel userModel = UserModel.fromFirebaseUser(user);
      return Right(userModel);
    } on FirebaseException catch (e) {
      log('AuthRepoImpl - signInWithGoogle - FirebaseException: ${e.code} - ${e.message}');

      if (e.code == 'user-cancelled' || e.code == 'sign_in_cancelled') {
        return Left(ServerFailure('تم إلغاء عملية تسجيل الدخول.'));
      }

      return Left(ServerFailure(e.message ?? 'حدث خطأ من Firebase.'));
    } on CustomException catch (e) {
      log('AuthRepoImpl - signInWithGoogle - CustomException: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('AuthRepoImpl - signInWithGoogle - Unexpected Error: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        collectionPath: BackendEndpoint.users, data: user.toMap());
  }

  // @override
  // Future<Either<Failure, UserEntity>> signInWithFacebook() async {
  //   try {
  //     final userCredential = await firebaseServiceAuth.signInWithFacebook();
  //     final user = userCredential.user!;
  //     UserModel userModel = UserModel.fromFirebaseUser(user);
  //     return Right(userModel);
  //   } on FirebaseException catch (e) {
  //     log('AuthRepoImpl - signInWithFacebook - FirebaseException: ${e.code} - ${e.message}');

  //     if (e.code == 'user-cancelled' || e.code == 'sign_in_cancelled') {
  //       return Left(ServerFailure('تم إلغاء عملية تسجيل الدخول.'));
  //     }

  //     return Left(ServerFailure(e.message ?? 'حدث خطأ من Firebase.'));
  //   } on CustomException catch (e) {
  //     log('AuthRepoImpl - signInWithFacebook - CustomException: ${e.message}');
  //     return Left(ServerFailure(e.message));
  //   } catch (e) {
  //     log('AuthRepoImpl - signInWithFacebook - Unexpected Error: ${e.toString()}');
  //     return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.'));
  //   }
  // }
}
