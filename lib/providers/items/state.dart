part of '../_.dart';

@freezed
class ItemsState with _$ItemsState {
  const ItemsState._();
  const factory ItemsState({
    @Default([]) List<Item> items,
    @Default([]) List<SelectedItemState> selectedItems,
  }) = _ItemsState;
}

@freezed
class SelectedItemState with _$SelectedItemState {
  const SelectedItemState._();
  const factory SelectedItemState({
    required Item item,
    required double discount,
    required double quantity,
  }) = _SelectedItemState;
}
