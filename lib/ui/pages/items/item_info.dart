part of 'page.dart';

class _ItemInfoDialog extends StatelessWidget {
  final Item item;
  const _ItemInfoDialog(this.item);

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.textTheme.titleMedium;
    return AlertDialog.adaptive(
      title: Text(item.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Id: ${item.id}', style: context.textTheme.labelSmall),
            const SpaceBetween(),
            Text('Description', style: titleStyle),
            Text(item.description),
            const SpaceBetween(),
            Text('Tax code', style: titleStyle),
            Text(item.taxCode.label),
            const SpaceBetween(),
            Text('Price per unit', style: titleStyle),
            Text('Tshs ${item.price}'),
            const SpaceBetween(),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'))
      ],
    );
  }
}
