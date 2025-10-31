part of 'create_an_account_cubit.dart';

@immutable
sealed class CreateAnAccountState {}

final class CreateAnAccountInitial extends CreateAnAccountState {}

final class CreateAnAccountLoading extends CreateAnAccountState {}

final class CreateAnAccountFailure extends CreateAnAccountState {
  final String errorMessage;
  CreateAnAccountFailure({required this.errorMessage});
}

final class CreateAnAccountSuccess extends CreateAnAccountState {
  final UserEntity user;
  CreateAnAccountSuccess({required this.user});
}
