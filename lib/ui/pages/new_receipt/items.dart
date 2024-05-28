part of 'page.dart';

class _Items extends ConsumerWidget {
  const _Items();

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(newReceiptProvider.notifier);
    final state = ref.watch(newReceiptProvider);
    final value = state.value;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 0),
            itemCount: value?.items.length ?? 0,
            shrinkWrap: true,
            // physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = value?.items[index];
              if (item == null) return const SizedBox.shrink();
              return ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: IconButton(
                    // onPressed: () => notifier.removeItem(index),
                    onPressed: (){},
                    icon: const Icon(Icons.clear_rounded)),
                title: Text(item.item.name),
                subtitle: Text(
                  'Price: Tsh ${item.item.price}'
                  '\nQuantity: ${item.quantity} ${item.item.unit}'
                  '\nDiscount: Tsh ${item.discount}'
                  '\nTotal price: Tsh ${(item.item.price * item.quantity) - item.discount}',
                ),
                // onTap: () {},
              );
            }),
            const _AddItem()
      ],
    );
  }
}
