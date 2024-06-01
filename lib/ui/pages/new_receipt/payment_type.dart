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
        Wrap(
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
        const SpaceBetween(),
        Text('Total tax: ${value?.tax??0}', style: context.textTheme.bodyLarge),
        Text('Total dicount: ${value?.discount??0}',style: context.textTheme.bodyLarge),
        Text('Total tax ex: ${value?.price??0}', style: context.textTheme.bodyLarge),
        const SpaceBetween(),
        Text('Total: ${value?.totalAmount??0}',style: context.textTheme.headlineSmall),
      ],
    );
  }
}
