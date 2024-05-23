part of '../_.dart';

@Riverpod(keepAlive: true)
class NewReceipt extends _$NewReceipt {
  @override
  FutureOr<NewReceiptState> build() => const NewReceiptState();

  void changeCurrentStep(int index) =>
      update((cb) => cb.copyWith(currentStep: index));

  void changeCustomerName(String text) =>
      update((cb) => cb.copyWith(customerName: text));

  void changeCustomerId(String text) =>
      update((cb) => cb.copyWith(customerId: text));

  void changeCustomerMobile(String text) =>
      update((cb) => cb.copyWith(customerMobile: text));

  void changeIdType(IdType type) => update((cb) => cb.copyWith(idType: type));

  void changePaymentType(PaymentType type) =>
      update((cb) => cb.copyWith(paymentType: type));
}
