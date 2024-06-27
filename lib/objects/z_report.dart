final class ZReport {
  final int id;
  final dynamic netAmount,
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
  ZReportStatus get zReportStatus => switch (status) {
    2=>ZReportStatus.sent,
    3=>ZReportStatus.fail,
    4=>ZReportStatus.blocked,
    5=>ZReportStatus.excluded,
    1||_=>ZReportStatus.pending,
  };
}

enum ZReportStatus {
  pending,
  sent,
  fail,
  blocked,
  excluded;

  String get label => switch (this) {
        ZReportStatus.pending => 'Pending',
        ZReportStatus.sent => 'Sent',
        ZReportStatus.blocked => 'Blocked by TRA',
        ZReportStatus.excluded => 'Excluded',
    ZReportStatus.fail => 'Failed',
      };
}
