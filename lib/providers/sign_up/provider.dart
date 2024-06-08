part of '../_.dart';

@riverpod
class SignUp extends _$SignUp {
  @override
  FutureOr<SignUpState> build() {
    return const _SignUpState(
        businessName: '',
        tin: '',
        email: '',
        phoneNumber: '',
        password: '',
        confirmPassword: '');
  }

  void changeBusinessName(String text) =>
      update((cb) => cb.copyWith(businessName: text));

  void changeTIN(String text) => update((cb) => cb.copyWith(tin: text));

  void changeEmail(String text) => update((cb) => cb.copyWith(email: text));

  void changePhoneNumber(String text) =>
      update((cb) => cb.copyWith(phoneNumber: text));

  void changePassword(String text) =>
      update((cb) => cb.copyWith(password: text));

  void changeConfirmPassword(String text) =>
      update((cb) => cb.copyWith(confirmPassword: text));

  void submit() async {
    if (state case AsyncValue(:final SignUpState value)) {
      state = const AsyncLoading()..copyWithPrevious(state);
      state = await AsyncValue.guard(() async {
        final response =
            await _post(endpoint: 'registration/register_new_customer', body: {
          'tinNumber': value.tin,
          'businessName': value.businessName,
          'emailAddress': value.email,
          'phoneNumber': '0${value.phoneNumber}',
          'password': value.password,
          'repeatPassword': value.confirmPassword,
        }).then((value) => _response(value));
        final bodyStatusCode = response.bodyStatusCode;
        if (bodyStatusCode != 200) {
          dynamic message;
          try {
            message = response.data['message'];
          } catch (e) {
            message = null;
          }
          throw message ?? response.statusDesc ?? 'Unexpected error occurred';
        } else {
          final message = response.data['message'];
          return value.copyWith(message: message);
        }
      });
    }
  }
}
