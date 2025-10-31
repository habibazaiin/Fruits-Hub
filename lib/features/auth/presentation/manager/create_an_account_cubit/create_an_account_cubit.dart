import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'create_an_account_state.dart';

class CreateAnAccountCubit extends Cubit<CreateAnAccountState> {
  final AuthRepo authRepo;
  CreateAnAccountCubit({required this.authRepo})
      : super(CreateAnAccountInitial());
  Future<void> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    emit(CreateAnAccountLoading());
    final result = await authRepo.createAccount(
        name: name, email: email, password: password);
    result.fold(
      (failure) {
        emit(CreateAnAccountFailure(errorMessage: failure.errMessage));
      },
      (user) {
        emit(CreateAnAccountSuccess(user: user));
      },
    );
  }
}