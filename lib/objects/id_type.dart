part of '_.dart';

enum IdType {
  tin('TIN', 1),
  license('Driving license', 2),
  voterId('Voter\'s number', 3),
  passport('Passport', 4),
  nationalId('National Identity', 5),
  others('None', 6);

  final String label;
  final int value;
  const IdType(this.label, this.value);
}

extension StringExtensionForIdType on String {
  IdType get toIdType {
    for (final value in IdType.values) {
      if (value.name == this) return value;
    }
    return IdType.others;
  }
}

extension IdTypeExtension on int {
  String get idTypeLabel {
    if (this case int value) {
      for (final type in IdType.values) {
        if (type.value == value) return type.label;
      }
    }
    return IdType.others.label;
  }
}
