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

  String get vatRate => switch (this) {
        TaxCode.a => 'A',
        TaxCode.b => 'B',
        TaxCode.c => 'C',
        TaxCode.d => 'D',
        TaxCode.e => 'E',
      };

  String get label => switch (this) {
        TaxCode.a => 'CODE A (Standard)',
        TaxCode.b => 'CODE B (Special rate)',
        TaxCode.c => 'CODE C (Zero rated)',
        TaxCode.d => 'CODE D (Special relief)',
        TaxCode.e => 'CODE E (Exempted)',
      };
}
