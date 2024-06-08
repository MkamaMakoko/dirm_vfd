part of '../_.dart';

@freezed
class NewReceiptState with _$NewReceiptState {
  const NewReceiptState._();
  const factory NewReceiptState({
    @Default(0) int currentStep,
    required CustomersState customersState,
    @Default(PaymentType.cash) PaymentType paymentType,
    required ItemsState itemsState,
    ReceiptResult? result,
  }) = _NewReceiptState;

  StepState get step0State {
    if (currentStep == 0) return StepState.indexed;
    if (currentStep == 1) return StepState.editing;
    if (customersState.customer != null) {
      return StepState.complete;
    }
    return StepState.error;
  }

  StepState get step1State {
    final emptyItems = itemsState.selectedItems.isEmpty;
    if (currentStep <= 1 && emptyItems) return StepState.indexed;
    if (currentStep == 2) return StepState.editing;
    if (emptyItems) return StepState.error;
    return StepState.complete;
  }

  bool get canPreview =>
      customersState.customer != null &&
      itemsState.selectedItems.isNotEmpty &&
      result == null;

  double get price {
    double total = 0;
    for (final value in itemsState.selectedItems) {
      total += value.totalPrice;
    }
    return total;
  }

  double get priceTaxExcluded {
    double total = 0;
    for (final value in itemsState.selectedItems) {
      total += value.totalPriceTaxExcluded;
    }
    return total;
  }

  // double get priceWithTax => price + tax;

  double get discount {
    double total = 0;
    for (final value in itemsState.selectedItems) {
      total += value.discount;
    }
    return total;
  }

  double get tax {
    if (customersState.customer?.vrn.isEmpty ?? true) return 0;
    double total = 0;
    for (final value in itemsState.selectedItems) {
      total += value.totalTax;
    }
    return total;
  }

  double get totalAmount => price - discount;
}

final class ReceiptResult {
  final dynamic id,
      clientId,
      verificationCode,
      verificationUrl,
      statusDescription;

  final dynamic receiptNumber, zNumber, status, receiptStatus;
  final dynamic date;

  ReceiptResult({
    required this.id,
    required this.clientId,
    required this.receiptNumber,
    required this.zNumber,
    required this.status,
    required this.receiptStatus,
    required this.verificationCode,
    required this.verificationUrl,
    required this.statusDescription,
    required this.date,
  });

  factory ReceiptResult.fromMap(Map map) => ReceiptResult(
        id: map['id'],
        clientId: map['clientId'],
        receiptNumber: map['rctNum'],
        zNumber: map['zNum'],
        status: map['status'],
        verificationCode: map['traReceiptVerificationCode'],
        statusDescription: map['statusDesc'],
        receiptStatus: map['receiptStatus'],
        verificationUrl: map['traReceiptVerificationUrl'],
        date: map['dateTime'],
        // date: DateTime.tryParse((map['dateTime'] as String)) ?? DateTime.now(),
      );
}
