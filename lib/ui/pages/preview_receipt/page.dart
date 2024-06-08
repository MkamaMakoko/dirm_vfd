import 'dart:convert';
import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/in_button_progress_indicator.dart';
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
import 'package:share_plus/share_plus.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:widgets_to_image/widgets_to_image.dart';
part 'printer_widget.dart';
part 'receipt_widget.dart';

@RoutePage()
class PreviewReceiptPage extends ConsumerWidget {
  final _controller = WidgetsToImageController();
  PreviewReceiptPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final width =
        (screenWidth - edgeInsertValue * 2) > 330 ? 330 : screenWidth.toInt();
    final state = ref.watch(newReceiptProvider);
    void waitDialog() {
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
    }

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
        waitDialog();
        await _controller.capture().then((image) {
          Navigator.pop(context);
          if (image case Uint8List image) {
            showModalBottomSheet(
                context: context,
                builder: (context) => _PrinterWidget(image, width, result));
          }
        });
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Preview receipt'),
        actions: [
          if (state
              case AsyncData(
                value: NewReceiptState(
                  result: ReceiptResult(:final verificationUrl)
                )
              )) ...[
            IconButton.filledTonal(
                onPressed: () async {
                  waitDialog();
                  print('createing pdf...');
                  // final pdf = await _pdfDelegate.exportToPdfDocument('pdf');
                  print('sharing pdf...');
                  final pdf = pw.Document();
                  pdf.addPage(pw.Page(
                    pageFormat: PdfPageFormat.roll57,
                    build: (context) {
                      // pw.Builder(builder:(context)=>_ReceiptPage());
                      // return pw.;
                    },
                  ));
                  await Share.shareXFiles([
                    XFile.fromData(await pdf.save(), name: 'receipt.pdf')
                  ]).then((_) {
                    Navigator.pop(context);
                  }).catchError((error) {
                    context.snackBar(message: error.toString(), error: true);
                  });
                },
                icon: const Icon(Icons.share_rounded)),
            IconButton.filledTonal(
                onPressed: () async =>
                    await urlLauncher(url: verificationUrl, context: context),
                icon: const Icon(Icons.launch_rounded))
          ]
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        // onPressed: state is! AsyncLoading
        //     ? ref.read(newReceiptProvider.notifier).submit
        //     : null,
        onPressed: ref.read(newReceiptProvider.notifier).submit,
        label: Text(switch (state) {
          AsyncLoading() => 'Please wait...',
          AsyncError() => 'Submit & Print (Retry)',
          _ => 'Submit & Print',
        }),
        icon: switch (state) {
          AsyncLoading() => const InButtonProgressIndicator(),
          _ => const Icon(Icons.print_rounded),
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(edgeInsertValue),
          child: SizedBox(
            width: width.toDouble(),
            child: WidgetsToImage(
              controller: _controller,
              child: const _ReceiptPage(),
            ),
          ),
        ),
      ),
    );
  }
}
