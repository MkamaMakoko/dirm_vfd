part of '_.dart';

@riverpod
Future<FullReceipt> receipt(ReceiptRef ref, {required Object id}) async {
  final response =
      await _post(endpoint: 'receipts/get_by_id', body: {'receiptId': id})
          .then((value) => _response(value));
  if (response.statusCode != 200) {
    throw response.statusDesc ?? 'Unexpected error occurred';
  }
  return FullReceipt.fromMap(response.data);
}
