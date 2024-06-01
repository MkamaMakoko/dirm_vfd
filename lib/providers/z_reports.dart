part of '_.dart';

@riverpod
Future<ZReportsResult> zReports(ZReportsRef ref,
    {int page = 1, int size = 50}) async {
  final token =
      await ref.watch(userProvider.selectAsync((value) => value?.token));
  final response = await _post(
          endpoint: 'zreports',
          body: {
            'page': page,
            'size': size,
          },
          token: token)
      .then((value) => _response(value));
  if (response.bodyStatusCode != 200) {
    throw response.statusDesc ?? 'Unexpected error occurred';
  } else {
    final received = response.body['zreportsRetrieved'];
    final totalPages = response.body['totalPages'];
    final totalZReports = response.body['totalZreports'];
    return ZReportsResult(
      receipts: [for (final _ in response.data as Iterable) Receipt()],
      received: received,
      totalPages: totalPages,
      totalZReports: totalZReports,
    );
  }
}

final class ZReportsResult {
  final List<Receipt> receipts;
  final int received, totalPages, totalZReports;

  ZReportsResult({
    required this.receipts,
    required this.received,
    required this.totalPages,
    required this.totalZReports,
  });
}
