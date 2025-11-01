import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
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
        throw CustomException('كلمة المرور المُدخلة ضعيفة جدًا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('هذا الحساب موجود بالفعل لهذا الإيميل.');
      } else {
        throw CustomException('حدث خطأ غير معروف من Firebase.');
      }
    } catch (e) {
      log('FirebaseServiceAuth - createUserWithEmailAndPassword - Unexpected Error: ${e.toString()} & ecode ${e.hashCode}');
      throw CustomException('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.');
    }
  }
}
