part of 'page.dart';

class _AddItemDialog extends StatefulWidget {
  final Item item;
  const _AddItemDialog(this.item);

  @override
  State<_AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<_AddItemDialog> {
  late final TextEditingController discountTEC, quantityTEC;
//TODO
  @override
  void initState() {
    super.initState();
    discountTEC = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    quantityTEC = TextEditingController(text: '1')
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(widget.item.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: quantityTEC,
              maxLines: 1,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                final number = int.tryParse(text ?? '');
                if (number == null) return 'Invalid quantity';
                if (number < 1) {
                  return 'Quantity cannot be 0 ${widget.item.unit}';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: 'Quantity',
                  prefixIcon: Icon(Icons.numbers_rounded)),
            ),
            const SpaceBetween(),
            TextFormField(
              controller: discountTEC,
              maxLines: 1,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) return null;
                final number = double.tryParse(text);
                if (number == null) return 'Invalid discount price';
                if (number < 0) {
                  return 'Discount cannot be less than 0';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: 'Discount',
                  prefixIcon: Icon(Icons.discount_rounded)),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        FilledButton.tonal(
            onPressed: () {
              final ({Item item, int quantity, double discount}) value = (
                item: widget.item,
                quantity: int.tryParse(quantityTEC.text) ?? 1,
                discount: double.tryParse(discountTEC.text) ?? .0
              );
              Navigator.pop(context, value);
            },
            child: const Text('Submit')),
      ],
    );
  }
}
