final class Receipt {
  final dynamic id;
  final dynamic clientId,
      tin,
      vrn,
      custName,
      mobileNum,
      rctNum,
      zNum,
      status,
      dateTime,
      totalTaxExcl,
      totalTaxIncl,
      discount,
      pmtType,
      pmtAmount;

  Receipt(
      {required this.id,
      required this.clientId,
      required this.tin,
      required this.vrn,
      required this.custName,
      required this.mobileNum,
      required this.rctNum,
      required this.zNum,
      required this.status,
      required this.dateTime,
      required this.totalTaxExcl,
      required this.totalTaxIncl,
      required this.discount,
      required this.pmtType,
      required this.pmtAmount});

  factory Receipt.fromMap(Map map) => Receipt(
      id: map['id'],
      clientId: map['clientId'],
      tin: map['tin'],
      vrn: map['vrn'],
      custName: map['custName'],
      mobileNum: map['mobileNum'],
      rctNum: map['rctNum'],
      zNum: map['zNum'],
      status: map['status'],
      dateTime: map['dateTime'],
      totalTaxExcl: map['totalTaxExcl'],
      totalTaxIncl: map['totalTaxIncl'],
      discount: map['discount'],
      pmtType: map['pmtType'],
      pmtAmount: map['pmtAmount']);
}
