final class FullReceipt {
  final dynamic id,
      clientId,
      dateTime,
      custIdType,
      custId,
      custName,
      mobileNum,
      tin,
      vrn,
      rctNum,
      zNum,
      zReport,
      hasVrn,
      clientVrn,
      createdBy,
      usedBusinessName,
      createdAt,
      updatedAt,
      totalTaxExcl,
      discount,
      pmtType,
      pmtAmount,
      receiptStatus,
      traReceiptVerificationCode,
      traReceiptVerificationUrl,
      totalTaxIncl;

  final List<ReceiptItem> items;

  final List<ReceiptVATTotals> vatTotals;

  FullReceipt(
      {required this.id,
      required this.clientId,
      required this.dateTime,
      required this.custIdType,
      required this.custId,
      required this.custName,
      required this.mobileNum,
      required this.tin,
      required this.vrn,
      required this.rctNum,
      required this.zNum,
      required this.zReport,
      required this.hasVrn,
      required this.clientVrn,
      required this.createdBy,
      required this.usedBusinessName,
      required this.createdAt,
      required this.updatedAt,
      required this.totalTaxExcl,
      required this.discount,
      required this.pmtType,
      required this.pmtAmount,
      required this.receiptStatus,
      required this.traReceiptVerificationCode,
      required this.traReceiptVerificationUrl,
      required this.totalTaxIncl,
      required this.items,
      required this.vatTotals});

  factory FullReceipt.fromMap(Map map) => FullReceipt(
        id: map['id'],
        clientId: map['clientId'],
        dateTime: map['dateTime'],
        custIdType: map['custIdType'],
        custId: map['custId'],
        custName: map['custName'],
        mobileNum: map['mobileNum'],
        tin: map['tin'],
        vrn: map['vrn'],
        rctNum: map['rctNum'],
        zNum: map['zNum'],
        zReport: map['zReport'],
        hasVrn: map['hasVrn'],
        clientVrn: map['clientVrn'],
        createdBy: map['createdBy'],
        usedBusinessName: map['usedBusinessName'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt'],
        totalTaxExcl: map['totals']['totalTaxExcl'],
        totalTaxIncl: map['totals']['totalTaxIncl'],
        discount: map['totals']['discount'],
        pmtType: map['payments']['pmtType'],
        pmtAmount: map['payments']['pmtAmount'],
        receiptStatus: map['receiptStatus'],
        traReceiptVerificationCode: map['traReceiptVerificationCode'],
        traReceiptVerificationUrl: map['traReceiptVerificationUrl'],
        items: [for (final map in map['items']) ReceiptItem.fromMap(map)],
        vatTotals: [
          for (final map in map['vatTotals']) ReceiptVATTotals.fromMap(map)
        ],
      );
}

final class ReceiptItem {
  final dynamic id, desc, qyt, taxCode, amt, discount;
  ReceiptItem(
      {required this.id,
      required this.desc,
      required this.qyt,
      required this.taxCode,
      required this.amt,
      required this.discount});

  factory ReceiptItem.fromMap(Map map) => ReceiptItem(
        id: map['id'],
        desc: map['desc'],
        qyt: map['qty'],
        taxCode: map['taxCode'],
        amt: map['amt'],
        discount: map['discount'],
      );
}

final class ReceiptVATTotals {
  final dynamic vatRate, nettAmount, taxAmount;

  ReceiptVATTotals(
      {required this.vatRate,
      required this.nettAmount,
      required this.taxAmount});

  factory ReceiptVATTotals.fromMap(Map map) => ReceiptVATTotals(
        vatRate: map['vatRate'],
        nettAmount: map['nettAmount'],
        taxAmount: map['taxAmount'],
      );
}
