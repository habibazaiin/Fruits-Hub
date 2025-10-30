import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/errors/exception.dart';

class FirebaseServiceAuth {
  Future<User> createUserWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('The account already exists for that email.');
      } else {
        throw CustomException(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      throw CustomException('An unknown error occurred.');
    }
  }
}
