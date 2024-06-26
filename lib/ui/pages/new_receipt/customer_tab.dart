part of 'page.dart';

class _CustomerTab extends ConsumerWidget {
  const _CustomerTab();

  @override
  Widget build(BuildContext context, ref) {
    final customersState = ref.watch(customersProvider);
    final state = ref.watch(newReceiptProvider);
    final activeInputs = state is! AsyncLoading;
    final customer = customersState.value?.customer;
    final textStyle = context.textTheme.bodyLarge;
    if (customer case Customer customer) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(edgeInsertValue),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(customer.name, style: context.textTheme.titleMedium),
              Text('${customer.idType.label}: ${customer.customerId}',
                  style: textStyle),
              Text('Phone: 0${customer.phoneNumber}', style: textStyle),
              if (customer.vrn.isNotEmpty) Text('VRN: ${customer.vrn}', style: textStyle),
              if (activeInputs) ...[
                const SpaceBetween(),
                IconButton.filledTonal(
                    onPressed: () =>
                        ref.read(customersProvider.notifier).selectCustomer(null),
                    // label: const Text('Select different customer'),
                    icon: const Icon(Icons.clear_rounded))
              ]
            ],
          ),
        ),
      );
    }
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(edgeInsertValue),
        child: _AddCustomerInfo(),
      ),
    );
  }
}