final class ZReport {
  final String time;
  final num netAmount, taxAmount, gross;

  ZReport(
      {required this.time,
      required this.netAmount,
      required this.taxAmount,
      required this.gross});
}
