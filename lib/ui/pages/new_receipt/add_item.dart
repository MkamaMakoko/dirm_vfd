part of 'page.dart';

class _AddItem extends StatefulWidget {
  const _AddItem();

  @override
  State<_AddItem> createState() => __AddItemState();
}

class __AddItemState extends State<_AddItem> {
  static const _autoValidateMode = AutovalidateMode.onUserInteraction;
  late final TextEditingController nameTEC, descTEC, unitTEC, priceTEC;
  @override
  void initState() {
    super.initState();
    nameTEC = TextEditingController()..addListener(() => setState(() {}));
    descTEC = TextEditingController()..addListener(() => setState(() {}));
    unitTEC = TextEditingController(text: 'Unit')
      ..addListener(() => setState(() {}));
    priceTEC = TextEditingController()..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          autofocus: true,
          // enabled: activeInputs,
          controller: nameTEC,
          keyboardType: TextInputType.text,
          maxLines: 2,
          minLines: 1,
          // onChanged: notifier.changeName,
          textInputAction: TextInputAction.next,
          autovalidateMode: _autoValidateMode,
          // validator: (_) => value?.nameValidator,
          decoration: const InputDecoration(
            labelText: 'Item name',
            prefixIcon: Icon(Icons.abc_rounded),
          ),
        ),
        const SpaceBetween(),
        TextFormField(
          // enabled: activeInputs,
          controller: descTEC,
          keyboardType: TextInputType.text,
          maxLines: 8,
          minLines: 1,
          // onChanged: notifier.changeDescription,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Item Description',
            prefixIcon: Icon(Icons.description_rounded),
          ),
        ),
        const SpaceBetween(),
        TextFormField(
          // enabled: activeInputs,
          controller: unitTEC,
          keyboardType: TextInputType.text,
          maxLines: 1,
          // onChanged: notifier.changeUnit,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Measuring unit',
            prefixIcon: Icon(Icons.abc_rounded),
          ),
        ),
        const SpaceBetween(),
        TextFormField(
          // enabled: activeInputs,
          controller: priceTEC,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          maxLines: 1,
          // onChanged: notifier.changePrice,
          textInputAction: TextInputAction.done,
          autovalidateMode: _autoValidateMode,
          // validator: (_) => value?.priceValidator,
          // onEditingComplete: onSubmit,
          decoration: InputDecoration(
            labelText: 'Price per ${unitTEC.text}',
            prefixIcon: const Icon(Icons.price_change_rounded),
          ),
        ),
      ],
    );
  }
}
