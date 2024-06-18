import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/routes/router.gr.dart';
import 'package:dirm_vfd/ui/widgets/in_button_progress_indicator.dart';
import 'package:dirm_vfd/ui/widgets/receipt_widget.dart';
import 'package:dirm_vfd/ui/widgets/secondary_container.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:dirm_vfd/utils/format_number.dart';
import 'package:dirm_vfd/utils/launch_url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
part 'printer_widget.dart';
part 'receipt_widget.dart';

@RoutePage()
class PreviewReceiptPage extends ConsumerWidget {
  const PreviewReceiptPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final width =
        (screenWidth - edgeInsertValue * 2) > 330 ? 330 : screenWidth.toInt();
    final state = ref.watch(newReceiptProvider);
    ref.listen(newReceiptProvider, (_, state) async {
      if (state
          case AsyncData(value: NewReceiptState(result: ReceiptResult()))) {
        // context.router.removeRoute(const NewReceiptRoute() as RouteData);
        // context.router.
      }
      if (state case AsyncError(:final error, :final stackTrace)) {
        if (kDebugMode) print(stackTrace);
        context.snackBar(message: error.toString(), error: true);
      }
      if (state
          case AsyncData(value: NewReceiptState(:final ReceiptResult result))) {
        // waitDialog();
        // await _controller.capture().then((image) {
        //   Navigator.pop(context);
        //   if (image case Uint8List image) {
        //     showModalBottomSheet(
        //         context: context,
        //         builder: (context) => _PrinterWidget(image, width, result));
        //   }
        // });
        await context.router.replaceAll([
          const HomeRoute(),
          ReceiptRoute(receiptId: result.id),
        ]).then((_) {
          ref.read(newReceiptProvider.notifier).clearState();
        });
      }
    });
    final value = state.value;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Preview receipt'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        // onPressed: state is! AsyncLoading
        //     ? ref.read(newReceiptProvider.notifier).submit
        //     : null,
        onPressed: ref.read(newReceiptProvider.notifier).submit,
        label: Text(switch (state) {
          AsyncLoading() => 'Please wait...',
          AsyncError() => 'Submit (retry)',
          _ => 'Submit',
        }),
        icon: switch (state) {
          AsyncLoading() => const InButtonProgressIndicator(),
          _ => const Icon(Icons.done_rounded),
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(edgeInsertValue),
          child: SizedBox(
            width: width.toDouble(),
            child: ReceiptWidget(
              vatRate: [
                if (value?.userInfo?.vfdaInformation.isVatRegistered ?? true)
                  for (final item in value?.itemsState.selectedItems ??
                      <SelectedItemState>[])
                    (amount: item.totalTax, rate: item.taxCode.vatRate)
              ],
              items: [
                for (final item
                    in value?.itemsState.selectedItems ?? <SelectedItemState>[])
                  (
                    amount: item.totalPrice,
                    name: item.item.name,
                    quantity: item.quantity,
                    taxCode: item.taxCode.vatRate
                  )
              ],
              customerName: value?.customersState.customer?.name ?? '',
              customerId: value?.customersState.customer?.customerId ?? '',
              customerIdType:
                  value?.customersState.customer?.idType.label ?? '',
              vrn: value?.customersState.customer?.vrn ?? '',
              mobileNumber: value?.customersState.customer?.phoneNumber ?? '',
              receiptNumber: '---',
              zNumber: '---',
              dateTime: '---',
              totalTaxExcl: value?.priceTaxExcluded ?? 0,
              totalTaxIncl: value?.price ?? 0,
              discount: value?.discount ?? 0,
              verificationCode: '---',
              verificationUrl: '---',
            ),
            // child: WidgetsToImage(
            //   controller: _controller,
            //   child: const _ReceiptPage(),
            // ),
          ),
        ),
      ),
    );
  }
}
