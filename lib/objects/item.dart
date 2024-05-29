part of '_.dart';

final class Item {
  final int id;
  final double price;
  final String name, description, unit;
  final TaxCode taxCode;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.taxCode,
      required this.price,
      required this.unit});

  factory Item.fromMap(Map map) {
    final taxCodeValueNumber = (map['taxCode'] as int);
    TaxCode taxCode = TaxCode.a;
    for (final value in TaxCode.values) {
      if (value.valueNumber == taxCodeValueNumber) {
        taxCode = value;
        break;
      }
    }
    return Item(
        id: map['id'],
        name: map['name'],
        description: map['desc'],
        taxCode: taxCode,
        unit: map['unit'],
        price: map['price']);
  }
}
