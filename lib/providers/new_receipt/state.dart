part of '../_.dart';

@freezed
class NewReceiptState with _$NewReceiptState {
  const NewReceiptState._();
  const factory NewReceiptState({
    @Default(0) int currentStep,
    required CustomersState customersState,
    @Default(PaymentType.cash) PaymentType paymentType,
    required ItemsState itemsState,
  }) = _NewReceiptState;

  // String? get nameValidator => validateName(customerName);

  // String? get phoneValidator => validatePhone(customerMobile);

  // String? get customerIdValidator {
  //   return switch (idType) {
  //     IdType.tin => validateTin(customerId),
  //     _ => customerId.isEmpty ? 'Customer ID cannot be empty' : null,
  //   };
  // }

  StepState get step0State {
    if (currentStep == 0) return StepState.editing;
    if (customersState.customer != null) {
      return StepState.complete;
    }
    return StepState.error;
  }

  StepState get step1State {
    final emptyItems = itemsState.selectedItems.isEmpty;
    if (currentStep == 0 && emptyItems) return StepState.indexed;
    if (currentStep == 1) return StepState.editing;
    if (emptyItems) return StepState.error;
    return StepState.complete;
  }
}
