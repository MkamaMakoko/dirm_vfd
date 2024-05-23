part of '../_.dart';

@freezed
class NewReceiptState with _$NewReceiptState {
  const NewReceiptState._();
  const factory NewReceiptState({
    @Default(0) int currentStep,
    @Default('') String customerName,
    @Default('') String customerId,
    @Default('') String customerMobile,
    @Default(IdType.tin) IdType idType,
    @Default(PaymentType.cash) PaymentType paymentType,
  }) = _NewReceiptState;

  String? get nameValidator => validateName(customerName);

  String? get phoneValidator => validatePhone(customerMobile);

  String? get customerIdValidator {
    return switch (idType) {
      IdType.tin => validateTin(customerId),
      _ => customerId.isEmpty ? 'Customer ID cannot be empty' : null,
    };
  }

  StepState get step0State {
    if (currentStep == 0) return StepState.editing;
    if (nameValidator == null &&
        customerIdValidator == null &&
        phoneValidator == null) {
      return StepState.complete;
    }
    return StepState.error;
  }
}
