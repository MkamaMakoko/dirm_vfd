part of '../_.dart';

@Riverpod(keepAlive: true)
class NewReceipt extends _$NewReceipt {
  @override
  FutureOr<NewReceiptState> build() async {
    return NewReceiptState(
        customersState: await ref.watch(customersProvider.future));
  }

  void changeCurrentStep(int index) =>
      update((cb) => cb.copyWith(currentStep: index));

  void changePaymentType(PaymentType type) =>
      update((cb) => cb.copyWith(paymentType: type));

  // void addItem(Item item, int quantity, double discount) =>
  //     update((cb) => cb.copyWith(items: [
  //           ...cb.items,
  //           (item: item, quantity: quantity, discount: discount)
  //         ]));

  // void removeItem(int index) {
  //   update((cb) {
  //     final items = [...cb.items]..removeAt(index);
  //     return cb.copyWith(items: items);
  //   });
  // }

  void clearState() {
    ref.invalidateSelf();
    ref.invalidate(customersProvider);
  }
}
