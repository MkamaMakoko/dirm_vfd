import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/objects/full_receipt.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/receipt_widget.dart';
import 'package:dirm_vfd/ui/widgets/secondary_container.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:dirm_vfd/utils/launch_url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
part 'print_widget.dart';

@RoutePage()
class ReceiptPage extends ConsumerStatefulWidget {
  final int receiptId;
  const ReceiptPage({super.key, required this.receiptId});

  @override
  ConsumerState<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends ConsumerState<ReceiptPage> {
  final _controller = WidgetsToImageController();
  final key = GlobalKey();
  Size size = const Size(350, 1000);
  ExportDelegate exportDelegate = ExportDelegate(
    options: const ExportOptions(
      pageFormatOptions: PageFormatOptions.roll80(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final width =
        (screenWidth - edgeInsertValue * 2) > 330 ? 330 : screenWidth.toInt();
    final provider = receiptProvider(id: widget.receiptId);
    final state = ref.watch(provider);
    final value = state.value;
    ref.listen(provider, (_, state) {
      if (state case AsyncError(:final error, :final stackTrace)) {
        if (kDebugMode) print(stackTrace);
        context.snackBar(message: error.toString(), error: true);
      }
    });
    exportDelegate = ExportDelegate(
      options: ExportOptions(
        pageFormatOptions: PageFormatOptions.custom(
          width: size.width + edgeInsertValue * 2,
          height: size.height,
          marginAll: edgeInsertValue,
        ),
      ),
    );
    return Scaffold(
      floatingActionButton: value is FullReceipt
          ? FloatingActionButton.extended(
              onPressed: () async {
                context.waitDialog();
                await _controller.capture().then((image) {
                  Navigator.pop(context);
                  if (image case Uint8List image) {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => _PrinterWidget(image, width));
                  }
                });
              },
              icon: const Icon(Icons.print_rounded),
              label: const Text('Print'),
            )
          : null,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text('Receipt view'),
            actions: [
              if (state case AsyncData(:final value)) ...[
                IconButton.filledTonal(
                    onPressed: () async {
                      setState(() {
                        final box =
                            key.currentContext?.findRenderObject() as RenderBox;
                        size = box.size;
                      });
                      context.waitDialog();
                      // print('exporting pdf...');
                      final pdf = await exportDelegate
                          .exportToPdfDocument('receiptPdf');
                      // print('sharing pdf...');
                      await Share.shareXFiles([
                        XFile.fromData(
                          await pdf.save(),
                          mimeType: 'receipt_${value.rctNum}.pdf',
                        )
                      ]).then((_) => Navigator.pop(context));
                    },
                    icon: const Icon(Icons.share_rounded)),
                IconButton.filledTonal(
                    onPressed: () async => await urlLauncher(
                        url: value.traReceiptVerificationUrl, context: context),
                    icon: const Icon(Icons.launch_rounded))
              ],
            ],
          ),
          if (state case AsyncLoading())
            const SliverPadding(
              padding: EdgeInsets.all(edgeInsertValue),
              sliver: SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator.adaptive()),
              ),
            ),
          if (value case FullReceipt receipt)
            SliverToBoxAdapter(
              child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(edgeInsertValue),
                  child: ExportFrame(
                      frameId: 'receiptPdf',
                      exportDelegate: exportDelegate,
                      child: WidgetsToImage(
                        controller: _controller,
                        child: CaptureWrapper(
                            key: const Key('captureWidget'),
                            child: ReceiptWidget(
                              key: key,
                              vatRate: [
                                for (final value in receipt.vatTotals)
                                  (amount: value.taxAmount, rate: value.vatRate)
                              ],
                              items: [
                                for (final item in receipt.items)
                                  (
                                    amount: item.amt,
                                    name: item.desc,
                                    quantity: item.qyt ?? 0,
                                    taxCode:
                                        (item.taxCode as int).getTaxCode.vatRate
                                  )
                              ],
                              customerName: receipt.custName,
                              customerId: receipt.custId,
                              customerIdType:
                                  (receipt.custIdType as int).idTypeLabel,
                              vrn: receipt.vrn,
                              mobileNumber: receipt.mobileNum,
                              receiptNumber: receipt.rctNum,
                              zNumber: receipt.zNum,
                              dateTime: receipt.dateTime,
                              totalTaxExcl: receipt.totalTaxExcl,
                              totalTaxIncl: receipt.totalTaxIncl,
                              // totalTax: receipt..,
                              discount: receipt.discount,
                              verificationCode:
                                  receipt.traReceiptVerificationCode,
                              verificationUrl:
                                  receipt.traReceiptVerificationUrl,
                            )),
                      ))),
            )
        ],
      ),
    );
  }
}
