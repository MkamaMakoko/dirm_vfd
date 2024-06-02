part of 'page.dart';

class _ItemsTab extends ConsumerWidget {
  const _ItemsTab();

  @override
  Widget build(BuildContext context, ref) {
    final unselect = ref
        .watch(itemsProvider.notifier.select((value) => value.unselectedItem));
    // final state = ref.watch(newReceiptProvider);
    // final value = state.value;
    final items = ref.watch(
        itemsProvider.select((state) => state.value?.selectedItems ?? []));
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.separated(
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
                  // contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  trailing: IconButton(
                      onPressed: () => unselect(item),
                      icon: const Icon(Icons.clear_rounded)),
                  title: Text(item.item.name),
                  subtitle: Text(
                    'Quantity: ${item.quantity} unit'
                    '\nTotal price: Tsh ${(item.item.price * item.quantity) - item.discount}',
                  ),
                  // onTap: () {},
                );
              }),
          const SpaceBetween(),
          Container(
              margin: const EdgeInsets.all(edgeInsertValue / 2),
              padding: const EdgeInsets.all(edgeInsertValue / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(edgeInsertValue),
                  color:
                      context.colorScheme.secondaryContainer.withOpacity(.5)),
              child: const _AddItem())
        ],
      ),
    );
  }
}
