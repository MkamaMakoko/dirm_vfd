part of '../_.dart';

@riverpod
class Login extends _$Login {
  @override
  FutureOr<LoginState> build() {
    return const _LoginState(email: '', password: '');
  }

  void changeEmail(String text) => update((s) => s.copyWith(email: text));
  void changePassword(String text) => update((s) => s.copyWith(password: text));

  void submit() async {
    if (state
        case AsyncValue(
          value: LoginState(
            :final String email,
            :final String password,
            canSubmit: true
          )
        )) {
      state = const AsyncLoading()..copyWithPrevious(state);
      state = await AsyncValue.guard(() async {
        final response = await (_post(
                endpoint: 'authenticate',
                body: {'email': email, 'password': password}))
            .then((value) => _response(value));
        final int bodyStatus = response.bodyStatusCode;
        if (bodyStatus !=200) {
          throw response.statusDesc ?? 'Unexpected error occurred';
        } else {
          ref.read(userProvider.notifier).changeValue(response.data);
          return _LoginState(email: email, password: password);
        }
      });
    }
  }
}
