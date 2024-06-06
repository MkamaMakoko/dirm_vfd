part of '_.dart';

// @riverpod
// Future<SearchReceipsResult> searchReceipts(SearchReceiptsRef ref,
//     {required String id}) async {
//   final response =
//       await _post(endpoint: 'receipts/get_by_id', body: {'receiptId': id})
//           .then((value) => _response(value));
//   if (response.bodyStatusCode != 200) {
//     throw response.statusDesc ?? 'Unexpected error occurred';
//   }
//   final data=
//   return SearchReceipsResult(
//     id: id,
//     clientId: clientId,
//     custId: custId,
//     mobileNum: mobileNum,
//     tin: tin,
//     rctNum: rctNum,
//     zNum: zNum,
//     createdBy: createdBy,
//     totalTaxExcl: totalTaxExcl,
//     totalTaxIncl: totalTaxIncl,
//     discount: discount,
//     pmtAmount: pmtAmount,
//     nettAmount: nettAmount,
//     taxAmount: taxAmount,
//     dateTime: dateTime,
//     custIdType: custIdType,
//     custName: custName,
//     vrn: vrn,
//     zReport: zReport,
//     hasVrn: hasVrn,
//     usedBusinessName: usedBusinessName,
//     pmtType: pmtType,
//     vatRate: vatRate,
//     receiptStatus: receiptStatus,
//     traReceiptVerificationCode: traReceiptVerificationCode,
//     traReceiptVerificationUrl: traReceiptVerificationUrl,
//     createdAt: createdAt,
//     updatedAt: updatedAt,
//     items: items,
//   );
// }

// final class SearchReceipsResult {
//   final num id,
//       clientId,
//       custId,
//       mobileNum,
//       tin,
//       rctNum,
//       zNum,
//       createdBy,
//       totalTaxExcl,
//       totalTaxIncl,
//       discount,
//       pmtAmount,
//       nettAmount,
//       taxAmount;
//   final String dateTime,
//       custIdType,
//       custName,
//       vrn,
//       zReport,
//       hasVrn,
//       usedBusinessName,
//       pmtType,
//       vatRate,
//       receiptStatus,
//       traReceiptVerificationCode,
//       traReceiptVerificationUrl;
//   final dynamic createdAt, updatedAt;

//   final List<
//       ({
//         String id,
//         String desc,
//         num qty,
//         num taxCode,
//         num amt,
//         num discount
//       })> items;

//   SearchReceipsResult(
//       {required this.id,
//       required this.clientId,
//       required this.custId,
//       required this.mobileNum,
//       required this.tin,
//       required this.rctNum,
//       required this.zNum,
//       required this.createdBy,
//       required this.totalTaxExcl,
//       required this.totalTaxIncl,
//       required this.discount,
//       required this.pmtAmount,
//       required this.nettAmount,
//       required this.taxAmount,
//       required this.dateTime,
//       required this.custIdType,
//       required this.custName,
//       required this.vrn,
//       required this.zReport,
//       required this.hasVrn,
//       required this.usedBusinessName,
//       required this.pmtType,
//       required this.vatRate,
//       required this.receiptStatus,
//       required this.traReceiptVerificationCode,
//       required this.traReceiptVerificationUrl,
//       required this.createdAt,
//       required this.updatedAt,
//       required this.items});
// }
