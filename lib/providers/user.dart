part of '_.dart';

@Riverpod(keepAlive: true)
class User extends _$User {
  final _box = Hive.box(hiveKeys.user);
  @override
  FutureOr<UserInfo?> build() async {
    // await Future.delayed(const Duration(seconds: 1));
    if (_box.isEmpty || _box.values.elementAt(0) == null) {
      return null;
    } else {
      final map = _box.values.elementAt(0);
      return UserInfo.fromMap(map);
    }
  }

  void changeValue(Map? value) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      _box.isEmpty ? await _box.add(value) : await _box.putAt(0, value);
      if (value == null) return null;
      return UserInfo.fromMap(value);
    });
  }
}
