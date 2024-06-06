final class ZReport {
  final int id;
  final String netAmount,
      taxAmount,
      gross,
      time,
      date,
      registrationDate,
      dailyTotal,
      discount,
      ticketsFiscal,
      status,
      createdAt,
      updatedAt;

  ZReport(
      {required this.id,
      required this.netAmount,
      required this.taxAmount,
      required this.gross,
      required this.time,
      required this.date,
      required this.registrationDate,
      required this.dailyTotal,
      required this.discount,
      required this.ticketsFiscal,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

  factory ZReport.fromMap(Map map) => ZReport(
      id: map['id'],
      netAmount: map['netAmount'],
      taxAmount: map['taxAmount'],
      gross: map['gross'],
      time: map['zReportTime'],
      date: map['zReportDate'],
      registrationDate: map['registrationDate'],
      dailyTotal: map['dailyTotal'],
      discount: map['discount'],
      ticketsFiscal: map['ticketsFiscal'],
      status: map['status'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt']);
}
