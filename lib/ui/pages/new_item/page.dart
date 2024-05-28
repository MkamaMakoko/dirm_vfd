import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class NewItemPage extends ConsumerWidget {
  NewItemPage({super.key});

  final provider = newItemProvider();
  static const _autoValidateMode = AutovalidateMode.onUserInteraction;

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(provider, (_, state) {
      bool? status;
      String? message;
      switch (state) {
        case AsyncError(:final error, :final stackTrace):
          {
            print(error);
            print(stackTrace);
            status = false;
            message = 'Unexpected error occurred';
          }
        case AsyncData(value: NewItemState(:final int id)):
          {
            status = true;
            message = 'Item added\nId: $id';
          }
      }
      if (message != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      }
      if (status != null && status) context.router.maybePop();
    });
    final notifier = ref.watch(provider.notifier);
    final state = ref.watch(provider);
    final value = state.value;
    final activeInputs = state is! AsyncLoading;

    final onSubmit =
        (value?.canSubmit ?? false) && activeInputs ? notifier.submit : null;
    return Scaffold(
      appBar: AppBar(title: const Text('Create new item')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(edgeInsertValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      autofocus: true,
                      enabled: activeInputs,
                      initialValue: value?.name,
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      minLines: 1,
                      onChanged: notifier.changeName,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: _autoValidateMode,
                      validator: (_) => value?.nameValidator,
                      decoration: const InputDecoration(
                        labelText: 'Item name',
                        prefixIcon: Icon(Icons.abc_rounded),
                      ),
                    ),
                    const SpaceBetween(),
                    TextFormField(
                      enabled: activeInputs,
                      initialValue: value?.description,
                      keyboardType: TextInputType.text,
                      maxLines: 8,
                      minLines: 1,
                      onChanged: notifier.changeDescription,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Item Description',
                        prefixIcon: Icon(Icons.description_rounded),
                      ),
                    ),
                    const SpaceBetween(),
                    TextFormField(
                      enabled: activeInputs,
                      initialValue: value?.taxCode,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      // minLines: 1,
                      onChanged: notifier.changeTaxCode,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: _autoValidateMode,
                      validator: (_) => value?.taxCodeValidator,
                      decoration: const InputDecoration(
                        labelText: 'Tax code',
                        prefixIcon: Icon(Icons.numbers_rounded),
                      ),
                    ),
                    const SpaceBetween(),
                    TextFormField(
                      enabled: activeInputs,
                      initialValue: value?.unit,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      onChanged: notifier.changeUnit,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Measuring unit',
                        prefixIcon: Icon(Icons.abc_rounded),
                      ),
                    ),
                    const SpaceBetween(),
                    TextFormField(
                      enabled: activeInputs,
                      initialValue: value?.price,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      maxLines: 1,
                      onChanged: notifier.changePrice,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: _autoValidateMode,
                      validator: (_) => value?.priceValidator,
                      onEditingComplete: onSubmit,
                      decoration: InputDecoration(
                        labelText: 'Price per ${value?.unit ?? 'Unit'}',
                        prefixIcon: const Icon(Icons.price_change_rounded),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(edgeInsertValue),
            child: SizedBox(
                width: double.maxFinite,
                child: FilledButton.icon(
                    icon: const Icon(Icons.add_rounded),
                    onPressed: onSubmit,
                    label: const Text('Submit'))),
          )
        ],
      ),
    );
  }
}
