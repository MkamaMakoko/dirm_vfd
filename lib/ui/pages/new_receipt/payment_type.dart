part of 'page.dart';

class _PaymentType extends ConsumerWidget {
  const _PaymentType();

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(newReceiptProvider.notifier);
    final state = ref.watch(newReceiptProvider);
    final value = state.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Payment type', style: context.textTheme.titleSmall),
        SizedBox(
          width: double.maxFinite,
          child: Wrap(
            spacing: edgeInsertValue / 2,
            children: [
              for (final type in PaymentType.values)
                ChoiceChip(
                  visualDensity: VisualDensity.compact,
                  label: Text(type.label),
                  selected: value?.paymentType == type,
                  onSelected: (value) {
                    if (value) notifier.changePaymentType(type);
                  },
                )
            ],
          ),
        ),
        const SpaceBetween(),
        SecondaryContainer(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total tax: ${formatNumber(value?.tax ?? 0)}',
                    style: context.textTheme.bodyLarge),
                Text('Total dicount: ${formatNumber(value?.discount ?? 0)}',
                    style: context.textTheme.bodyLarge),
                Text('Total tax ex: ${formatNumber(value?.price ?? 0)}',
                    style: context.textTheme.bodyLarge),
                const SpaceBetween(),
                Text('Total: ${formatNumber(value?.totalAmount ?? 0)}',
                    style: context.textTheme.headlineSmall),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
