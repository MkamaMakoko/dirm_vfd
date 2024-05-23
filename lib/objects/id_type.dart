part of '_.dart';

enum IdType {
  tin('TIN', 'TIN'),
  license('Driving license', 'Driving License'),
  voterId('Voter\'s number', 'Voters Number'),
  passport('Passport', 'Passport'),
  nationalId('National Identity', 'National Identity'),
  others('Other', 'NIL');

  final String label, value;
  const IdType(this.label, this.value);
}
