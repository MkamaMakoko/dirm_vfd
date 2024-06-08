part of '../_.dart';

@Riverpod(keepAlive: true)
class NewReceipt extends _$NewReceipt {
  bool _firstRun = true;
  late UserInfo? _user;

  @override
  FutureOr<NewReceiptState> build() async {
    _user = await ref.watch(userProvider.future);
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

  void clearState() {
    ref.invalidateSelf();
    ref.invalidate(customersProvider);
    ref.invalidate(itemsProvider);
    update((cb) => cb.copyWith(currentStep: 0));
  }

  void removeError() {
    if(state case AsyncError(:final NewReceiptState value)) {
      state = AsyncValue.data(value);
    }
  }

  void submit() async {
    if ((state, _user)
        case (AsyncValue(:final NewReceiptState value), UserInfo user)
        when state is! AsyncLoading) {
      state = const AsyncLoading()..copyWithPrevious(state);
      state = await AsyncValue.guard(() async {
        final customer = value.customersState.customer;
        final response = await _post(
                endpoint: 'receipts/post',
                body: {
                  'tin': user.vfdaInformation.tin,
                  // 'tin': 123490789,
                  'vrn': customer?.vrn,
                  'custIdType': customer?.idType.value,
                  'custId': customer?.customerId,
                  'custName': customer?.name,
                  'mobileNum': '0${customer?.phoneNumber}',
                  'items': [
                    for (final item in value.itemsState.selectedItems)
                      {
                        'id': item.item.id,
                        'desc': item.item.name,
                        'qty': item.quantity,
                        'taxCode': item.item.taxCode.valueNumber,
                        'amt': item.totalPrice,
                        'discount': item.discount,
                      }
                  ],
                  'totals': {
                    'totalTaxExcl': value.price,
                    'totalTaxIncl': value.totalAmount,
                    'discount': value.discount,
                  },
                  'payments': {
                    'pmtType': value.paymentType.value,
                    'pmtAmount': value.totalAmount,
                  },
                  'vatTotals': [
                    for (final item in value.itemsState.selectedItems)
                      {
                        "vatRate": item.item.taxCode.vatRate,
                        "nettAmount":
                            (item.totalPrice - item.discount) + item.totalTax,
                        "taxAmount": item.taxPerUnit
                      }
                  ]
                },
                token: user.token)
            .then((value) => _response(value));
        if (response.bodyStatusCode != 200 || response.body.isEmpty) {
          throw response.statusDesc ?? 'Unexpected error occurred';
        } else {
          print(response.data);
          print('object');
          final result = ReceiptResult.fromMap(response.data);
          return value.copyWith(result: result);
        }
      });
    }
  }
}
