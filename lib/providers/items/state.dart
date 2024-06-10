part of '../_.dart';

@freezed
class ItemsState with _$ItemsState {
  const ItemsState._();
  const factory ItemsState({
    @Default([]) List<Item> items,
    @Default([]) List<SelectedItemState> selectedItems,
  }) = _ItemsState;

  double get totalPrice {
    double total = 0;
    for (final item in selectedItems) {
      total += item.totalPrice;
    }
    return total;
  }
}

@freezed
class SelectedItemState with _$SelectedItemState {
  const SelectedItemState._();
  const factory SelectedItemState({
    required Item item,
    required double discount,
    required double quantity,
    required double price,
    required TaxCode taxCode,
  }) = _SelectedItemState;

  double get totalPrice => price * quantity;

  double get totalPriceTaxExcluded => pricePerUnitTaxExcluded * quantity;

  // double get totalPrice => totalPriceWithoutDiscount - discount;

  double get taxPerUnit {
    if (taxCode != TaxCode.a) return 0;
    return price-pricePerUnitTaxExcluded;
  }

  double get pricePerUnitTaxExcluded {
    if (taxCode != TaxCode.a) return 0;
    return price / 1.18;
  }

  double get totalTax => taxPerUnit * quantity;
}
