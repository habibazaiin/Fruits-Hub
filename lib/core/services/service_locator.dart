import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_service.dart';
import 'package:fruits_hub/core/services/firebase_service_auth.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseServiceAuth>(FirebaseServiceAuth());
  getIt.registerSingleton<DatabaseService>(FirebaseService());
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(firebaseServiceAuth: getIt<FirebaseServiceAuth>(),
          databaseService: getIt<DatabaseService>()));
}
