part of '_.dart';

enum PaymentType {
  cash('Cash', 'CASH'),
  cheque('Cheque', 'CHEQUE'),
  cCard('C-Card', 'CCARD'),
  eMoney('E-Money', 'EMONEY'),
  invoice('Invoice', 'INVOICE');

  final String label, value;
  const PaymentType(this.label, this.value);
}
