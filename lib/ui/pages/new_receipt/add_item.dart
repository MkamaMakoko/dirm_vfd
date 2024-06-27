part of 'page.dart';

class _AddItem extends ConsumerStatefulWidget {
  const _AddItem();

  @override
  ConsumerState<_AddItem> createState() => __AddItemState();
}

class __AddItemState extends ConsumerState<_AddItem> {
  static const _autoValidateMode = AutovalidateMode.onUserInteraction;
  late final TextEditingController nameTEC,
      // descTEC,
      // unitTEC,
      priceTEC,
      quantityTEC,
      discountTEC;
  late final itemsNotifier = ref.read(itemsProvider.notifier);
  Item? item;
  List<Item> items = [];
  List<SelectedItemState> selectedItems = [];
  TaxCode taxCode = TaxCode.a;

  double? get subTotal {
    final price = double.tryParse(priceTEC.text);
    final quantity = double.tryParse(quantityTEC.text);
    final discount = double.tryParse(discountTEC.text);
    if ((price, quantity) case (double price, double quantity)) {
      final total = price * quantity;
      if (discount case double discount) {
        return total - discount;
      }
      return total;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    nameTEC = TextEditingController()..addListener(() => setState(() {}));
    // descTEC = TextEditingController();
    // unitTEC = TextEditingController(text: 'Unit')
    //   ..addListener(() => setState(() {}));
    priceTEC = TextEditingController()..addListener(() => setState(() {}));
    quantityTEC = TextEditingController(text: 1.0.toString())
      ..addListener(() => setState(() {}));
    discountTEC = TextEditingController(text: .0.toString())
      ..addListener(() => setState(() {}));
  }

  String? get nameValidator => validateName(nameTEC.text);
  String? get quantityValidator {
    final number = double.tryParse(quantityTEC.text);
    if (number == null) return 'Invalid quantity';
    if (number <= 0) return 'Quantity cannot be less than or equal to 0.0';
    return null;
  }

  String? get priceValidator {
    final number = double.tryParse(priceTEC.text);
    if (number == null) return 'Invalid price';
    if (number <= 0) return 'Price cannot be less than to 0.0';
    return null;
  }

  String? get discountValidator {
    final number = double.tryParse(discountTEC.text);
    if (number == null) return 'Invalid discount';
    if (number < 0) return 'Discount cannot be less than to 0.0';
    final price = double.tryParse(priceTEC.text);
    if (price != null && number >= price) {
      return 'Discount must be less than price';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final itemsState = ref.watch(itemsProvider);
    items = itemsState.value?.items ?? [];
    selectedItems = itemsState.value?.selectedItems ?? [];
    final canAdd =
        ((nameValidator == null && priceValidator == null) || item != null) &&
            quantityValidator == null &&
            discountValidator == null;
    final onAdd = canAdd
        ? () {
            final discount = double.tryParse(discountTEC.text) ?? 0;
            final quantity = double.tryParse(quantityTEC.text) ?? 0;
            final price = double.tryParse(priceTEC.text) ?? 0;
            if (item case Item item) {
              itemsNotifier.selectItem(
                  item: item,
                  discount: discount,
                  quantity: quantity,
                  price: price,
                  taxCode: taxCode);
            } else {
              itemsNotifier.newItem(
                name: nameTEC.text,
                // description: descTEC.text,
                taxCode: taxCode,
                // unit: unitTEC.text,
                price: double.tryParse(priceTEC.text) ?? 0,
                discount: discount,
                quantity: quantity,
              );
            }
            nameTEC.clear();
            // descTEC.clear();
            // unitTEC.clear();
            priceTEC.clear();
            discountTEC.text = .0.toString();
            quantityTEC.text = '1';
            setState(() => item = null);
            FocusManager.instance.primaryFocus?.unfocus();
          }
        : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (item == null) ...[
          TypeAheadField<Item>(
              hideOnEmpty: true,
              controller: nameTEC,
              onSelected: (value) {
                priceTEC.text = value.price.toString();
                setState(() {
                  item = value;
                  taxCode = value.taxCode;
                });
              },
              suggestionsCallback: (search) {
                final values = items.where((item) {
                  final name = item.name.toLowerCase();
                  final text = search.toLowerCase();
                  return name.contains(text) || text.contains(name);
                });
                return values.toList();
              },
              itemBuilder: (context, value) => ListTile(
                    visualDensity: VisualDensity.compact,
                    title: Text(value.name),
                    subtitle: Text(value.taxCode.label),
                  ),
              builder: (context, controller, focusNode) {
                return TextFormField(
                  // autofocus: true,
                  focusNode: focusNode,
                  // enabled: activeInputs,
                  controller: controller,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  minLines: 1,
                  // onChanged: notifier.changeName,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: _autoValidateMode,
                  validator: (_) => nameValidator,
                  decoration: const InputDecoration(
                    labelText: 'Item/service name',
                    prefixIcon: Icon(Icons.abc_rounded),
                  ),
                );
              }),
          const SpaceBetween(),
        ] else if (item case Item item) ...[
          ListTile(
            trailing: IconButton(
                onPressed: () => setState(() => this.item = null),
                icon: const Icon(Icons.clear_rounded)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(edgeInsertValue)),
            tileColor: context.colorScheme.secondaryContainer,
            contentPadding: const EdgeInsets.only(left: edgeInsertValue / 2),
            visualDensity: VisualDensity.compact,
            title: Text(item.name),
            subtitle: Text('Original price: ${item.price}'),
          ),
          const SpaceBetween()
        ],
        TextFormField(
          // enabled: activeInputs,
          controller: priceTEC,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          maxLines: 1,
          // onChanged: notifier.changePrice,
          textInputAction: TextInputAction.next,
          autovalidateMode: _autoValidateMode,
          validator: (_) => priceValidator,
          // onEditingComplete: onSubmit,
          decoration: const InputDecoration(
            labelText: 'Price per unit',
            prefixIcon: Icon(Icons.price_change_rounded),
          ),
        ),
        const SpaceBetween(),
        DropdownMenu<TaxCode>(
            label: const Text('Tax code'),
            initialSelection: taxCode,
            onSelected: (value) {
              if (value != null) {
                setState(() => taxCode = value);
              }
            },
            dropdownMenuEntries: [
              for (final value in TaxCode.values)
                DropdownMenuEntry(value: value, label: value.label)
            ]),
        const SpaceBetween(),
        TextFormField(
          // enabled: activeInputs,
          controller: quantityTEC,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          maxLines: 1,
          // onChanged: notifier.changePrice,
          textInputAction: TextInputAction.next,
          autovalidateMode: _autoValidateMode,
          validator: (_) => quantityValidator,
          // onEditingComplete: onSubmit,
          decoration: const InputDecoration(
            labelText: 'Quantity',
            prefixIcon: Icon(Icons.numbers_rounded),
          ),
        ),
        const SpaceBetween(),
        TextFormField(
          // enabled: activeInputs,
          controller: discountTEC,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          maxLines: 1,
          // onChanged: notifier.changePrice,
          validator: (_) => discountValidator,
          textInputAction: TextInputAction.done,
          onEditingComplete: () {
            onAdd?.call();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          autovalidateMode: _autoValidateMode,
          // validator: (_) => discountValidator,
          // onEditingComplete: onSubmit,
          decoration: const InputDecoration(
            labelText: 'Discount price',
            prefixIcon: Icon(Icons.numbers_rounded),
          ),
        ),
        if (subTotal case double subtotal) ...[
          const SpaceBetween(times: 2),
          Text(
            'Sub total price',
            style: context.textTheme.labelSmall,
          ),
          Text(formatNumber(subtotal), style: context.textTheme.headlineSmall),
        ],
        const SpaceBetween(),
        SizedBox(
          width: double.maxFinite,
          child: FilledButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add_rounded),
            label: const Text('Add item/service'),
          ),
        )
      ],
    );
  }
}
