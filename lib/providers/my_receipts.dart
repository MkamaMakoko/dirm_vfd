part of '_.dart';

@riverpod
Future<MyReceiptsResults> myReceipts(MyReceiptsRef ref,
    {int page = 1, int size = 50}) async {
  final selectedBranch = await ref.watch(selectedBranchProvider.future);
  final token =
      await ref.watch(userProvider.selectAsync((value) => value?.token));
  final response = await _post(
          endpoint: 'receipts',
          body: {
            'page': page,
            'size': size,
            'clientId': selectedBranch?.id,
          },
          token: token)
      .then((value) => _response(value));
  if (response.bodyStatusCode != 200) {
    throw response.statusDesc ?? 'Unexpected error occurred';
  } else {
    final received = response.body['receiptsRetrieved'];
    final totalPages = response.body['totalPages'];
    final totalReceipts = response.body['totalReceipts'];
    return MyReceiptsResults(
      receipts: [
        for (final map in response.data as Iterable) Receipt.fromMap(map)
      ]..sort((a, b) {
          final int ia = a.id;
          final int ib = b.id;
          return ia < ib ? 0 : 1;
        }),
      received: received,
      totalPages: totalPages,
      totalReceipts: totalReceipts,
    );
  }
}

final class MyReceiptsResults {
  final List<Receipt> receipts;
  final int received, totalPages, totalReceipts;

  MyReceiptsResults({
    required this.receipts,
    required this.received,
    required this.totalPages,
    required this.totalReceipts,
  });
}

@riverpod
Future<MyReceiptsResults> searchReceipts(SearchReceiptsRef ref,
    {String? customerName,
    DateTime? startDate,
    DateTime? endDate,
    num? maxmum,
    num? minimum,
    PaymentType? paymentType,
    String? tin,int page = 1, int size = 50}) async {
  final selectedBranch = await ref.watch(selectedBranchProvider.future);
  final token =
      await ref.watch(userProvider.selectAsync((value) => value?.token));
  final response = await _post(
          endpoint: 'receipts',
          body: {
            'page': page,
            'size': size,
            'clientId': selectedBranch?.id,
            if (customerName != null) 'customerName': customerName,
            if (startDate != null) 'startingDate': startDate.toString(),
            if (endDate != null) 'endingDate': endDate.toString(),
            if (minimum != null) 'minimumAmount': minimum,
            if (maxmum != null) 'maximumAmount': maxmum,
            if (paymentType != null) 'paymentType': paymentType.value,
            if (tin != null) 'tinNumber': tin
          },
          token: token)
      .then((value) => _response(value));
  if (response.bodyStatusCode != 200) {
    throw response.statusDesc ?? 'Unexpected error occurred';
  } else {
    final received = response.body['receiptsRetrieved'];
    final totalPages = response.body['totalPages'];
    final totalReceipts = response.body['totalReceipts'];
    return MyReceiptsResults(
      receipts: [
        for (final map in response.data as Iterable) Receipt.fromMap(map)
      ]..sort((a, b) {
          final int ia = a.id;
          final int ib = b.id;
          return ia < ib ? 0 : 1;
        }),
      received: received,
      totalPages: totalPages,
      totalReceipts: totalReceipts,
    );
  }
}
