part of '../_.dart';

@Riverpod(keepAlive: true)
class NewReceipt extends _$NewReceipt {
  bool _firstRun = true;

  @override
  FutureOr<NewReceiptState> build() async {
    final int currentStep;
    if (_firstRun) {
      _firstRun = false;
      currentStep = 0;
    } else {
      currentStep = state.value?.currentStep ?? 0;
    }
    return NewReceiptState(
      currentStep: currentStep,
        itemsState: await ref.watch(itemsProvider.future),
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
