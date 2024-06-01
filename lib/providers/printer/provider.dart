part of '../_.dart';

final _bluetooth = BluetoothPrint.instance;

@Riverpod(keepAlive: true)
Stream<List<BluetoothDevice>> _devices(_DevicesRef _) async* {
  await _bluetooth.startScan(timeout: const Duration(seconds: 4));
  await for (final devices in _bluetooth.scanResults) {
    yield devices;
  }
}

@Riverpod(keepAlive: true)
Stream<bool> _deviceConnected(_DeviceConnectedRef _) async* {
  await for (final state in _bluetooth.state) {
    yield switch (state) {
      BluetoothPrint.CONNECTED => true,
      BluetoothPrint.DISCONNECTED || _ => false,
    };
  }
}

@Riverpod(keepAlive: true)
class Printer extends _$Printer {
  @override
  Stream<PrinterState> build() async* {
    yield _PrinterState(
      devices: await ref.watch(_devicesProvider.future),
      isConnected: await ref.watch(_deviceConnectedProvider.future),
    );
  }

  void startScan() async {
    await _bluetooth.startScan(timeout: const Duration(seconds: 5));
  }

  void connectDevice(BluetoothDevice device) async {
    if (state is AsyncLoading) return;
    state = const AsyncLoading()..copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      await _bluetooth.connect(device);
      return future;
    });
  }

  void disconnectDevice() async {
    if (state is AsyncLoading) return;
    state = const AsyncLoading()..copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      await _bluetooth.disconnect();
      return future;
    });
  }

  void print() async {
    // final numberFormat = NumberFormat("\$###,###.00","en_US");
    final config = <String, dynamic>{
      // 'width': 50,
      // 'height': 70,
      // 'gap': 2,
    };

    // List<LineText> list = [];
    // list.add(LineText(
    //     type: LineText.TYPE_TEXT, x: 10, y: 40, content: 'this is content'));

    await _bluetooth.printLabel(config, [
      LineText(
        align: 1,
        type: LineText.TYPE_TEXT,
        weight: 2,
        content: '***   START OF LEGAL RECEIPT   ****',
        linefeed: 1,
      ),
      //TODO: logo
      LineText(
          align: 1,
          type: LineText.TYPE_TEXT,
          weight: 0,
          content: '***   DIRM TECHWORKS   ****'),
      // LineText(
      //   align: 1,
      //   type: LineText.TYPE_TEXT,
      //   weight: 4
      // )
    ]);
  }
}
