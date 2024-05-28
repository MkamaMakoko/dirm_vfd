part of '_.dart';

final class Customer {
  int id;
  String name, phoneNumber, customerId, vrn;
  IdType idType;

  Customer(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.customerId,
      required this.idType,
      required this.vrn});

  factory Customer.fromMap(Map map) => Customer(
        id: map['id'],
        name: map['name'],
        phoneNumber: map['phoneNumber'],
        customerId: map['customerId'],
        idType: (map['idType'] as String).toIdType,
        vrn: map['vrn'],
      );
}
