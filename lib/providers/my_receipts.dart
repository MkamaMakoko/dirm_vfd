part of '_.dart';

@riverpod
Future<MyReceiptsResults> myReceipts(MyReceiptsRef ref,
    {int page = 1, int size = 50}) async {
  final token =
      await ref.watch(userProvider.selectAsync((value) => value?.token));
  final response = await _post(
          endpoint: 'receipts',
          body: {
            'page': page,
            'size': size,
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
      ],
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
