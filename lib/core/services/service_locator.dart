import 'package:fruits_hub/core/services/firebase_service_auth.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseServiceAuth>(FirebaseServiceAuth());
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(firebaseServiceAuth: getIt<FirebaseServiceAuth>()));
}
