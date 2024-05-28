part of 'page.dart';

class _AddCustomerInfo extends ConsumerStatefulWidget {
  const _AddCustomerInfo();

  @override
  ConsumerState<_AddCustomerInfo> createState() => _AddCustomerInfoState();
}

class _AddCustomerInfoState extends ConsumerState<_AddCustomerInfo> {
  late final TextEditingController nameTEC, phoneTEC, idTEC, vrnTEC;
  IdType idType = IdType.tin;
  late final notifier = ref.read(newReceiptProvider.notifier);
  late final customersNotifier = ref.read(customersProvider.notifier);
  String? get namevalidator => validateName(nameTEC.text);
  String? get phoneValidator => validatePhone(phoneTEC.text);
  String? get idValidator => validateCustomerId(id: idTEC.text, type: idType);
  String? get vrnValidator => validateVRN(vrnTEC.text);

  void Function()? get onSaveCustomer =>
      ref.read(customersProvider.notifier.select((value) {
        if (namevalidator == null &&
            phoneValidator == null &&
            idValidator == null &&
            vrnValidator == null) {
          return () => value.saveCustomer(
              name: nameTEC.text,
              phone: phoneTEC.text,
              vrn: vrnTEC.text,
              customerId: idTEC.text,
              idType: idType);
        }
        return null;
      }));

  @override
  void initState() {
    super.initState();
    nameTEC = TextEditingController()..addListener(() => setState(() {}));
    vrnTEC = TextEditingController()..addListener(() => setState(() {}));
    phoneTEC = TextEditingController()..addListener(() => setState(() {}));
    idTEC = TextEditingController()..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newReceiptProvider);
    final customersState = ref.watch(customersProvider);
    final customers = customersState.value?.customers;
    // final value = state.value;
    final enabledInputs =
        customersState is! AsyncLoading && state is! AsyncLoading;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TypeAheadField<Customer>(
            hideOnEmpty: true,
            controller: nameTEC,
            onSelected: customersNotifier.selectCustomer,
            suggestionsCallback: (search) {
              final values = customers?.where((customer) {
                final name = customer.name.toLowerCase();
                final text = search.toLowerCase();
                return name.contains(text) || text.contains(name);
              });
              return values?.toList();
            },
            itemBuilder: (context, value) => ListTile(
                  visualDensity: VisualDensity.compact,
                  title: Text(value.name),
                  subtitle: Text('${value.idType.label}: ${value.phoneNumber}'),
                ),
            builder: (context, controller, focusNode) {
              return TextFormField(
                enabled: state is! AsyncLoading,
                controller: controller,
                focusNode: focusNode,
                textInputAction: TextInputAction.next,
                maxLines: 2,
                minLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (_) => namevalidator,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: 'Name', prefixIcon: Icon(Icons.person_rounded)),
              );
            }),
        const SpaceBetween(),
        TextFormField(
          enabled: enabledInputs,
          controller: phoneTEC,
          minLines: 1,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (_) => phoneValidator,
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
                selected: idType == type,
                onSelected: enabledInputs
                    ? (value) {
                        if (value) setState(() => idType = type);
                      }
                    : null,
              )
          ],
        ),
        const SpaceBetween(),
        TextFormField(
          enabled: enabledInputs,
          controller: idTEC,
          minLines: 1,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (_) => idValidator,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: idType.label,
              prefixIcon: const Icon(Icons.perm_identity_rounded)),
        ),
        TextFormField(
          enabled: enabledInputs,
          controller: vrnTEC,
          minLines: 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (_) => vrnValidator,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          onEditingComplete: onSaveCustomer,
          decoration: const InputDecoration(
              labelText: 'VRN', prefixIcon: Icon(Icons.numbers_rounded)),
        ),
        const SpaceBetween(),
        SizedBox(
          width: double.maxFinite,
          child: FilledButton.icon(
            onPressed: onSaveCustomer,
            label: const Text('Add customer'),
            icon: const Icon(Icons.person_add_rounded),
          ),
        )
      ],
    );
  }
}
