part of '_.dart';

typedef Branch = ({String id, String name});

@Riverpod(keepAlive: true)
class SelectedBranch extends _$SelectedBranch {
  @override
  Future<Branch?> build() async {
    final info = await ref.watch(userProvider.future);
    return info?.branches.first;
  }

  void changeBracnh(Branch branch) {
    update((_) => branch);
  }
}
