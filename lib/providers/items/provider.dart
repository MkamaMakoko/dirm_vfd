part of '../_.dart';

@Riverpod(keepAlive: true)
class Items extends _$Items {
  final _box = Hive.box(hiveKeys.items);

  List<Item> get _items {
    final values = _box.values;
    return [for (final value in values) Item.fromMap(value)];
  }

  @override
  Stream<ItemsState> build() async* {
    yield ItemsState(items: _items);
    await for (final _ in _box.watch()) {
      yield ItemsState(items: _items);
    }
  }

  void deleteItem(int index) async {
    if (state case AsyncData(:final value)) {
      state = const AsyncLoading()..copyWithPrevious(state);
      state = await AsyncValue.guard(() async {
        await _box.deleteAt(index);
        return ItemsState(items: _items, selectedItems: value.selectedItems);
      });
    }
  }

  void newItem(
      {required String name,
      // required String description,
      required TaxCode taxCode,
      // required String unit,
      required double price,
      required double discount,
      required double quantity}) async {
    if (state case AsyncData(:final value)) {
      state = const AsyncLoading()..copyWithPrevious(state);
      state = await AsyncValue.guard(() async {
        final id = DateTime.now().microsecondsSinceEpoch;
        await _box.add({
          'id': id,
          'name': name,
          'desc': '',
          'taxCode': taxCode.valueNumber,
          // 'unit': null,
          'price': price,
        });
        final item = SelectedItemState(
          item: _items.singleWhere((element) => element.id == id),
          discount: discount,
          quantity: quantity,
          price: price,
          taxCode: taxCode,
        );
        return ItemsState(
            items: _items, selectedItems: [...value.selectedItems, item]);
      });
    }
  }

  void selectItem(
          {required Item item,
          required double discount,
          required double quantity,
          required double price,
          required TaxCode taxCode}) =>
      update((cb) {
        final items = [
          ...cb.selectedItems,
          SelectedItemState(
            item: item,
            discount: discount,
            quantity: quantity,
            price: price,
            taxCode: taxCode,
          )
        ];
        return cb.copyWith(selectedItems: items);
      });

  void unselectedItem(SelectedItemState itemState) => update((cb) {
        final items = [...cb.selectedItems]..remove(itemState);
        return cb.copyWith(selectedItems: items);
      });
}
