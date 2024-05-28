part of 'page.dart';

class _InfoDialog extends StatelessWidget {
  final Customer customer;
  const _InfoDialog(this.customer);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.bodyLarge;
    return AlertDialog.adaptive(
      title: Text(customer.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text('Details', style: context.textTheme.titleMedium),
            SelectableText('Phone: 0${customer.phoneNumber}', style: textStyle),
            SelectableText('${customer.idType.label}: ${customer.customerId}',
                style: textStyle),
            if (customer.vrn.isNotEmpty)
              SelectableText('VRN: ${customer.vrn}', style: textStyle),
          ],
        ),
      ),
      actions: [
        FilledButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.create_rounded),
            label: const Text('Create receipt')),
        FilledButton.tonalIcon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.delete_forever_rounded),
            label: const Text('Delete')),
        OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close')),

        // IconButton.filledTonal(
        //     onPressed: () {}, icon: const Icon(Icons.close_rounded)),
        // IconButton.filledTonal(
        //     onPressed: () {}, icon: const Icon(Icons.delete_forever_rounded)),
        // IconButton.filledTonal(
        //     onPressed: () {}, icon: const Icon(Icons.call_rounded)),
        // IconButton.filled(
        //     onPressed: () {}, icon: const Icon(Icons.create_rounded)),
      ],
    );
  }
}
