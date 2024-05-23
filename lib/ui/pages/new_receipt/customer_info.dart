part of 'page.dart';

class _CustomerInfo extends ConsumerWidget {
  const _CustomerInfo();

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(newReceiptProvider.notifier);
    final state = ref.watch(newReceiptProvider);
    final value = state.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          initialValue: value?.customerName,
          onChanged: notifier.changeCustomerName,
          maxLines: 2,
          minLines: 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (_) => value?.nameValidator,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
              labelText: 'Name', prefixIcon: Icon(Icons.person_rounded)),
        ),
        const SpaceBetween(),
        TextFormField(
          initialValue: value?.customerMobile,
          onChanged: notifier.changeCustomerMobile,
          minLines: 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (_) => value?.phoneValidator,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
              labelText: 'Phone number',
              prefixText: '+255',
              prefixIcon: Icon(Icons.contact_phone_rounded)),
        ),
        const SpaceBetween(times: 2),
        Text('Customer ID type', style: context.textTheme.titleSmall),
        Wrap(
          spacing: edgeInsertValue / 2,
          children: [
            for (final type in IdType.values)
              ChoiceChip(
                visualDensity: VisualDensity.compact,
                label: Text(type.label),
                selected: value?.idType == type,
                onSelected: (value) {
                  if (value) notifier.changeIdType(type);
                },
              )
          ],
        ),
        const SpaceBetween(),
        TextFormField(
          initialValue: value?.customerId,
          onChanged: notifier.changeCustomerId,
          minLines: 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (_) => value?.customerIdValidator,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: value?.idType.label,
              prefixIcon: const Icon(Icons.perm_identity_rounded)),
        ),
      ],
    );
  }
}
