part of '../_.dart';

@freezed
class SignUpState with _$SignUpState {
  const SignUpState._();
  const factory SignUpState(
      {String? message,
      required String businessName,
      required String tin,
      required String email,
      required String phoneNumber,
      required String password,
      required String confirmPassword}) = _SignUpState;

  String? get nameValidator => validateName(businessName);

  String? get tinValidator => validateTin(tin);

  String? get emailValidator => validateEmail(email);

  String? get phoneNumberValidator => validatePhone(phoneNumber);

  String? get passwordValidator => validatePassword(password);

  String? get confirmPasswordValidator {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  bool get canSubmit =>
      nameValidator == null &&
      tinValidator == null &&
      emailValidator == null &&
      passwordValidator == null &&
      confirmPasswordValidator == null;
}
