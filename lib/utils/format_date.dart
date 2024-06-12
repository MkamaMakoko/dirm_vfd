import 'package:intl/intl.dart';

String formatDate({DateTime? time, String? timeString}) {
  final formatter = DateFormat('dd-MM-yyyy\t\tkk:mm');
  if (time != null) return formatter.format(time);
  return formatter
      .format(DateTime.tryParse(timeString ?? '') ?? DateTime.now());
}

String formatDateOnly({DateTime? time, String? timeString}) {
  final formatter = DateFormat('dd-MM-yyyy');
  if (time != null) return formatter.format(time);
  return formatter
      .format(DateTime.tryParse(timeString ?? '') ?? DateTime.now());
}

String formatTimeOnly({DateTime? time, String? timeString}) {
  final formatter = DateFormat('kk:mm');
  if (time != null) return formatter.format(time);
  return formatter
      .format(DateTime.tryParse(timeString ?? '') ?? DateTime.now());
}
