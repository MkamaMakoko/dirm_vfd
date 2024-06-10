import 'package:intl/intl.dart';

String formatNumber(num number) => NumberFormat('###,##0.00').format(number);
