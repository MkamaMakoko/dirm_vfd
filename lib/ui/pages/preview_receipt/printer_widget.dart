part of 'page.dart';

class _PrinterWidget extends StatefulWidget {
  final Uint8List image;
  const _PrinterWidget(this.image);

  @override
  State<_PrinterWidget> createState() => _PrinterWidgetState();
}

class _PrinterWidgetState extends State<_PrinterWidget> {
  final bluetooth = BluetoothPrint.instance;
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
    await bluetooth.startScan(timeout: const Duration(seconds: 4));
  }

  @override
  void dispose() {
    bluetooth.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void pop() => Navigator.pop(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(edgeInsertValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (error case String error)
              Text('Error: ${kDebugMode ? error : 'failed to print'}'),
            Text('Choose a bluetooth device',
                style: context.textTheme.titleMedium),
            const SpaceBetween(),
            StreamBuilder(
              stream: bluetooth.scanResults,
              builder: (context, snapshot) {
                if (snapshot
                    case AsyncSnapshot(:final List<BluetoothDevice> data)) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final device = data[index];
                      return ListTile(
                        trailing: connectedDevice?.address == device.address
                            ? const Icon(Icons.bluetooth_connected_rounded)
                            : null,
                        title: Text(device.name ?? 'Bluetooth device'),
                        onTap: () async {
                          await bluetooth.connect(device).then((_) {
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
                  AsyncSnapshot(data: BluetoothPrint.CONNECTED) => SizedBox(
                      width: double.maxFinite,
                      child: FilledButton(
                          onPressed: () async {
                            try {
                              await bluetooth.printReceipt({}, [
                                LineText(
                                    type: LineText.TYPE_IMAGE,
                                    width: 320,
                                    height: 700,
                                    content: base64Encode(widget.image),
                                    align: LineText.ALIGN_CENTER,
                                    linefeed: 1)
                              ]);
                            } catch (e) {
                              setState(() => error = e.toString());
                            }
                          },
                          child: Text(
                              'Print with ${connectedDevice?.name ?? 'device'}')),
                    ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
