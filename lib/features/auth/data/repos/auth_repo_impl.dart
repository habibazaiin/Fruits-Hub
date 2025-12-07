import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/errors/exception.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_service_auth.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseServiceAuth firebaseServiceAuth;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseServiceAuth});

  @override
  Future<Either<Failure, UserEntity>> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    User? user;
    try {
      user = await firebaseServiceAuth.createUserWithEmailAndPassword(
          emailAddress: email, password: password);
      UserEntity userEntity =
          UserEntity(id: user.uid, email: email, name: name);
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
      var userEntity = await getUserData(userId: userModel.id);
      await saveUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('AuthRepoImpl - signIn - Unexpected Error: ${e.toString()} & ecode ${e.hashCode}');
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseServiceAuth.signInWithGoogle();

      UserModel userModel = UserModel.fromFirebaseUser(user);
      bool userExists = await databaseService.doucumentExists(
          collectionPath: BackendEndpoint.isUserExists,
          documentId: userModel.id);
      if (!userExists) {
        await addUserData(user: userModel);
      } else {
        userModel = await getUserData(userId: userModel.id) as UserModel;
      await saveUserData(user: userModel);
      }
      return Right(userModel);
    } on FirebaseException catch (e) {
      if (user != null) {
        firebaseServiceAuth.deleteUser();
      }
      log('AuthRepoImpl - signInWithGoogle - FirebaseException: ${e.code} - ${e.message}');

      if (e.code == 'user-cancelled' || e.code == 'sign_in_cancelled') {
        return Left(ServerFailure('تم إلغاء عملية تسجيل الدخول.'));
      }

      return Left(ServerFailure(e.message ?? 'حدث خطأ من Firebase.'));
    } on CustomException catch (e) {
      if (user != null) {
        firebaseServiceAuth.deleteUser();
      }
      log('AuthRepoImpl - signInWithGoogle - CustomException: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        firebaseServiceAuth.deleteUser();
      }
      log('AuthRepoImpl - signInWithGoogle - Unexpected Error: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        collectionPath: BackendEndpoint.addUserData,
        data: UserModel.fromUserEntity(user).toMap(),
        documentId: user.id);
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    Map<String, dynamic> userData = await databaseService.getData(
        collectionPath: BackendEndpoint.getUserData, documentId: userId);
    return UserModel.fomJson(userData);
  }
  
  @override
  Future saveUserData({required UserEntity user}) async {
    var userModel = const JsonEncoder().convert(UserModel.fromUserEntity(user).toMap());
    await Prefs.setString(kUserDataKey, userModel);
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
