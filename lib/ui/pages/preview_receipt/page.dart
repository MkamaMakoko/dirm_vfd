import 'dart:convert';
import 'package:auto_route/annotations.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/secondary_container.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
part 'printer_widget.dart';

@RoutePage()
class PreviewReceiptPage extends ConsumerWidget {
  final _controller = WidgetsToImageController();
  PreviewReceiptPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final stars = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpaceBetween(),
        Text('******************************',
            style: context.textTheme.bodyLarge?.copyWith(color: Colors.black)),
        const SpaceBetween(),
      ],
    );
    Widget infoText({required String name, required String value}) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$name : ',
                style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            Expanded(
                child: Text(
              value,
              style: context.textTheme.bodyLarge?.copyWith(color: Colors.black),
              textAlign: TextAlign.right,
            )),
          ],
        );

    final state = ref.watch(newReceiptProvider);
    final userState = ref.watch(userProvider);
    final uservalue = userState.value;
    final value = state.value;
    ref.listen(newReceiptProvider, (_, state) {
      if (state case AsyncError(:final error, :final stackTrace)) {
        if (kDebugMode) {
          print(error);
          print(stackTrace);
        }
        context.snackBar(message: error.toString(), error: true);
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Preview receipt')),
      floatingActionButton: FloatingActionButton.extended(
        // onPressed: state is! AsyncLoading
        //     ? ref.read(newReceiptProvider.notifier).submit
        //     : null,
        onPressed: () async {
          showAdaptiveDialog(
              context: context,
              builder: (context) => const AlertDialog.adaptive(
                    title: Text('Please wait...'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LinearProgressIndicator(),
                      ],
                    ),
                  ));
          await _controller.capture().then((image) {
            Navigator.pop(context);
            if (image case Uint8List image) {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => _PrinterWidget(image));
            }
          });
        },
        label: const Text('Print'),
        icon: const Icon(Icons.print_rounded),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(edgeInsertValue),
          child: SizedBox(
            width: 300,
            child: WidgetsToImage(
              controller: _controller,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Text('***\t START OF LEGAL RECEIPT\t***',
                        style: context.textTheme.labelLarge
                            ?.copyWith(color: Colors.black)),
                    const SpaceBetween(),
                    const FlutterLogo(),
                    const SpaceBetween(),
                    Text(
                        uservalue?.clientInformation.businessName ??
                            'DIRM TECHWORKS',
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: Colors.black)),
                    infoText(
                        name: 'TEL',
                        value: '+255${uservalue?.clientInformation.mobile}'),
                    infoText(
                        name: 'TIN',
                        value: '${uservalue?.vfdaInformation.tin}'),
                    infoText(
                        name: 'VRN',
                        value: '${uservalue?.vfdaInformation.vrn}'),
                    infoText(
                        name: 'UIN',
                        value: '${uservalue?.vfdaInformation.uin}'),
                    infoText(
                        name: 'TAX OFFICE',
                        value: '${uservalue?.vfdaInformation.taxOffice}'),
                    stars,
                    infoText(
                        name: 'CUSTOMER NAME',
                        value: '${value?.customersState.customer?.name}'),
                    infoText(
                        name: 'CUSTOMER ID TYPE',
                        value:
                            '${value?.customersState.customer?.idType.label}'),
                    infoText(
                        name: 'CUSTOMER ID',
                        value: '${value?.customersState.customer?.customerId}'),
                    infoText(
                        name: 'CUSTOMER VRN',
                        value: '${value?.customersState.customer?.vrn}'),
                    infoText(
                        name: 'CUSTOMER MOBILE',
                        value:
                            '+255${value?.customersState.customer?.phoneNumber}'),
                    const SpaceBetween(),
                    infoText(name: 'RCT NO', value: '---'),
                    infoText(name: 'Z NUMBER', value: '---'),
                    infoText(name: 'RCT DATE', value: '---'),
                    stars,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('DESCRIPTION',
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: Colors.black)),
                        Text('QYT.',
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: Colors.black)),
                        Text('PRICE',
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: Colors.black))
                      ],
                    ),
                    for (final item in value?.itemsState.selectedItems ??
                        <SelectedItemState>[])
                      Row(
                        children: [
                          Flexible(
                              fit: FlexFit.tight,
                              child: Text(item.item.name,
                                  style: context.textTheme.bodyMedium
                                      ?.copyWith(color: Colors.black))),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              item.quantity.toString(),
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.black),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              item.totalPrice.toString(),
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.black),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    const SpaceBetween(times: 4),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
