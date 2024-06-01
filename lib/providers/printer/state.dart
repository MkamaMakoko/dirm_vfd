part of '../_.dart';

@freezed
class PrinterState with _$PrinterState {
  const PrinterState._();
  const factory PrinterState({
    required List<BluetoothDevice> devices,
    required bool isConnected,
  }) = _PrinterState;
}
