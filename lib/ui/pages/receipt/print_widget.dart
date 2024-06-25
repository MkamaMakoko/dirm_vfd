part of 'page.dart';

class _PrinterWidget extends StatefulWidget {
  final Uint8List image;
  final int height;
  // final ReceiptResult result;
  const _PrinterWidget(this.image, this.height);

  @override
  State<_PrinterWidget> createState() => _PrinterWidgetState();
}

class _PrinterWidgetState extends State<_PrinterWidget> {
  final bluetooth = BluetoothPrint.instance;
  static const waitTime = Duration(seconds: 4);
  BluetoothDevice? connectedDevice;
  String? error;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scan();
    });
  }

  void scan() async {
    await bluetooth.startScan(timeout: waitTime);
  }

  @override
  void dispose() {
    bluetooth.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rescanButton = SizedBox(
      width: double.maxFinite,
      child: FilledButton.tonalIcon(
          onPressed: () async {
            setState(() => connectedDevice = null);
            await bluetooth.disconnect();
            await bluetooth.destroy();
            await bluetooth.startScan(timeout: waitTime);
          },
          icon: const Icon(Icons.refresh_rounded),
          label: const Text('Refresh scanner')),
    );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(edgeInsertValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ListTile(
            //   leading: const Icon(Icons.launch_rounded),
            //   title: Text(widget.result.verificationCode),
            //   subtitle: Text(widget.result.verificationUrl),
            //   onTap: () async => urlLauncher(
            //       url: widget.result.verificationUrl, context: context),
            // ),
            if (error case String error)
              Text('Error: ${kDebugMode ? error : 'failed to print'}'),
            const SpaceBetween(),
            Text('Choose a bluetooth device',
                style: context.textTheme.titleLarge),
            const SpaceBetween(),
            StreamBuilder(
              stream: bluetooth.isScanning,
              builder: (context, snapshot) {
                if (snapshot.data ?? false) {
                  return const LinearProgressIndicator();
                }
                return const SizedBox.shrink();
              },
            ),
            StreamBuilder(
              stream: bluetooth.scanResults,
              builder: (context, snapshot) {
                if (snapshot
                    case AsyncSnapshot(:final List<BluetoothDevice> data)) {
                  if (data.isEmpty) {
                    return const Column(
                      children: [
                        SecondaryContainer(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.info_rounded),
                                SpaceBetween(),
                                Expanded(
                                    child: Text(
                                        'Make sure you\'ve turned on Bluetooth,'
                                        ' and paired with your Bluetooth printer'))
                              ]),
                        ),
                        SpaceBetween(),
                        // rescanButton,
                      ],
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final device = data[index];
                      return ListTile(
                        // contentPadding: EdgeInsets.zero,
                        trailing: connectedDevice?.address == device.address
                            ? const Icon(Icons.bluetooth_connected_rounded)
                            : null,
                        title: Text(device.name ?? 'Bluetooth device'),
                        onTap: () async {
                          if ((await bluetooth.isConnected ?? false)) {
                            await bluetooth.disconnect();
                          }
                          await bluetooth.connect(device).then((_) async {
                            setState(() => connectedDevice = device);
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: data.length,
                  );
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const LinearProgressIndicator();
              },
            ),
            StreamBuilder(
              stream: bluetooth.state,
              builder: (context, snapshot) {
                return switch (snapshot) {
                  AsyncSnapshot(data: BluetoothPrint.CONNECTED) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SecondaryContainer(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info_rounded),
                            SpaceBetween(),
                            Expanded(
                                child: Text('When the printer starts to print,'
                                    ' please wait unti the printer finishes'
                                    ' before closing'))
                          ],
                        )),
                        const SpaceBetween(),
                        SizedBox(
                          width: double.maxFinite,
                          child: FutureBuilder(
                              future: bluetooth.isConnected,
                              builder: (context, snapshot) {
                                final canPrint = snapshot.data ?? false;
                                return FilledButton(
                                    onPressed: canPrint
                                        ? () async {
                                            try {
                                              await bluetooth.printReceipt({}, [
                                                LineText(
                                                    type: LineText.TYPE_IMAGE,
                                                    // width: widget.width,
                                                    height: widget.height,
                                                    // width: 340,
                                                    width: receiptWidth,
                                                    // height: 640,
                                                    content: base64Encode(
                                                        widget.image),
                                                    align:
                                                        LineText.ALIGN_CENTER,
                                                    linefeed: 1)
                                              ]);
                                            } catch (e) {
                                              setState(
                                                  () => error = e.toString());
                                            }
                                          }
                                        : null,
                                    child: Text(
                                        'Print with ${connectedDevice?.name ?? 'device'}'));
                              }),
                        ),
                      ],
                    ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
            const SpaceBetween(),
            rescanButton,
            const SpaceBetween(),
          ],
        ),
      ),
    );
  }
}
