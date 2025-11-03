import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<User> signinWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw CustomException(
            'لا يوجد مستخدم بهذا الايميل, او كلمة المرور غير صحيحة');
      } else {
        throw CustomException('حدث خطأ غير معروف من Firebase.');
      }
    } catch (e) {
      log('FirebaseServiceAuth - SigninWithEmailAndPassword - Unexpected Error: ${e.toString()} & ecode ${e.hashCode}');
      throw CustomException('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw CustomException('تم إلغاء تسجيل الدخول بواسطة جوجل.');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user!;
    } catch (e) {
      log('FirebaseServiceAuth - SignInWithGoogle - Unexpected Error: ${e.toString()} & ecode ${e.hashCode}');
      throw CustomException('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.');
    }
  }
}
