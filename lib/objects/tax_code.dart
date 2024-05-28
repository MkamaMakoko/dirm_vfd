part of '_.dart';

enum TaxCode {
  a,
  b,
  c,
  d,
  e;

  int get valueNumber => switch (this) {
        TaxCode.a => 1,
        TaxCode.b => 2,
        TaxCode.c => 3,
        TaxCode.d => 4,
        TaxCode.e => 5
      };

  String get label => switch (this) {
        TaxCode.a => 'Standard (CODE A)',
        TaxCode.b => 'Special rate (CODE B)',
        TaxCode.c => 'Zero rated (CODE C)',
        TaxCode.d => 'Special relief (CODE D)',
        TaxCode.e => 'Exempted (CODE E)',
      };
}
