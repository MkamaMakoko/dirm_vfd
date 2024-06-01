part of '_.dart';

@riverpod
class DeleteAccount extends _$DeleteAccount {
  late String? token;
  @override
  FutureOr<bool?> build() async {
    token = await ref.watch(userProvider.selectAsync((value) => value?.token));
    return null;
  }

  void delete(String reason) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await _post(
              endpoint: 'account/delete',
              body: {
                'reason': reason,
              },
              token: token)
          .then((value) => _response(value));
      if (response.bodyStatusCode == 200) {
        ref.read(userProvider.notifier).changeValue(null);
        return true;
      }
      return false;
    });
  }
}
