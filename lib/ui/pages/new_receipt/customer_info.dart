part of 'page.dart';

class _CustomerInfo extends ConsumerWidget {
  const _CustomerInfo();

  @override
  Widget build(BuildContext context, ref) {
    final customersState = ref.watch(customersProvider);
    final state = ref.watch(newReceiptProvider);
    final activeInputs = state is! AsyncLoading;
    final customer = customersState.value?.customer;
    final textStyle = context.textTheme.bodyLarge;
    if (customer case Customer customer) {
      return SecondaryContainer(
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(customer.name, style: context.textTheme.titleMedium),
              const SpaceBetween(times: .5),
              Text('${customer.idType.label}: ${customer.customerId}',
                  style: textStyle),
              Text('Phone: 0${customer.phoneNumber}', style: textStyle),
              if (customer.vrn.isNotEmpty)
                Text('VRN: ${customer.vrn}', style: textStyle),
              if (activeInputs) ...[
                const SpaceBetween(),
                SizedBox(
                  width: double.maxFinite,
                  child: FilledButton.icon(
                      icon: const Icon(Icons.clear_rounded),
                      onPressed: () => ref
                          .read(customersProvider.notifier)
                          .selectCustomer(null),
                      label: const Text('Clear informartion')),
                )
                // IconButton.filled(
                //     onPressed: () => ref
                //         .read(customersProvider.notifier)
                //         .selectCustomer(null),
                //     // label: const Text('Select different customer'),
                //     icon: const Icon(Icons.clear_rounded))
              ]
            ],
          ),
        ),
      );
    }
    return const _AddCustomerInfo();
  }
}
