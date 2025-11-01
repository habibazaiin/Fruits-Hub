import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit({required this.authRepo})
      : super(SignUpInitial());
  Future<void> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    emit(SignUpLoading());
    final result = await authRepo.createAccount(
        name: name, email: email, password: password);
    result.fold(
      (failure) {
        emit(SignUpFailure(errorMessage: failure.errMessage));
      },
      (user) {
        emit(SignUpSuccess(user: user));
      },
    );
  }
}
