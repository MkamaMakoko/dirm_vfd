part of 'page.dart';

class _Items extends ConsumerWidget {
  const _Items();

  @override
  Widget build(BuildContext context, ref) {
    final unselect = ref
        .watch(itemsProvider.notifier.select((value) => value.unselectedItem));
    // final state = ref.watch(newReceiptProvider);
    // final value = state.value;
    final items = ref.watch(
        itemsProvider.select((state) => state.value?.selectedItems ?? []));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SecondaryContainer(
          child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(height: 0),
              itemCount: items.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  onTap: () async {
                    await showAdaptiveDialog(
                        context: context,
                        builder: (context) => _ItemDialog(item)).then((delete) {
                      if (delete != null) {
                        unselect(item);
                      }
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  trailing: IconButton(
                      onPressed: () => unselect(item),
                      icon: const Icon(Icons.clear_rounded)),
                  title: Text(item.item.name),
                  subtitle: Text(
                    'Quantity: ${item.quantity} units'
                    '\nTotal price: Tsh '
                    '${formatNumber((item.price * item.quantity) - item.discount)}',
                  ),
                  // onTap: () {},
                );
              }),
        ),
        const SpaceBetween(),
        const SecondaryContainer(
            padding: EdgeInsets.all(edgeInsertValue / 2), child: _AddItem())
      ],
    );
  }
}

class _ItemDialog extends StatelessWidget {
  final SelectedItemState item;
  const _ItemDialog(this.item);

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(item.item.name),
      actions: [
        OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close')),
        FilledButton.tonal(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Remove')),
      ],
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.item.description.isNotEmpty) ...[
              Text(item.item.description, style: context.textTheme.bodySmall),
              const SpaceBetween(),
            ],
            Text('Tax code: ${item.taxCode.label}',
                style: context.textTheme.bodyLarge),
            Text('Price per unit: ${item.price}',
                style: context.textTheme.bodyLarge),
            Text('Quantity: ${item.quantity} units',
                style: context.textTheme.bodyLarge),
            if (item.discount > 0)
              Text('Discount: ${item.discount}',
                  style: context.textTheme.bodyLarge),
            const SpaceBetween(),
            Text(
                'Total: Tshs ${(item.price * item.quantity) - item.discount}',
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
