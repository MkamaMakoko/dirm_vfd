part of '../_.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState({required String email, required String password}) =
      _LoginState;

  String? get emailValidator => validateEmail(email);
  String? get passwordValidator => null;
  bool get canSubmit => emailValidator == null && passwordValidator == null;
}
