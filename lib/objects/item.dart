part of '_.dart';

final class Item {
  final int id;
  final double price;
  final String name, description, taxCode, unit;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.taxCode,
      required this.price,
      required this.unit});

  factory Item.fromMap(Map map) => Item(
      id: map['id'],
      name: map['name'],
      description: map['desc'],
      taxCode: map['taxCode'],
      unit: map['unit'],
      price: map['price']);
}
