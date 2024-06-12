part of '../_.dart';

@Riverpod(keepAlive: true)
class Customers extends _$Customers {
  final _box = Hive.box(hiveKeys.customers);

  List<Customer> get _customers {
    final maps = _box.values;
    return [for (final map in maps) Customer.fromMap(map)];
  }

  @override
  Stream<CustomersState> build() async* {
    yield _CustomersState(customers: _customers);
    await for (final _ in _box.watch()) {
      yield _CustomersState(customers: _customers);
    }
  }

  // void changeName(String text) => update((cb) {
  //   return cb.copyWith(name: text);
  // });

  // void changePhone(String text) => update((cb) => cb.copyWith(phone: text));

  // void changeId(String text) => update((cb) => cb.copyWith(id: text));

  // void changeVrn(String text) => update((cb) => cb.copyWith(vrn: text));

  // void changeIdType(IdType type) => update((cb) => cb.copyWith(idType: type));

  void saveCustomer(
      {required String name,
      required String phone,
      required String vrn,
      required String customerId,
      required IdType idType}) async {
    print(state);
    if (state case AsyncData()) {
      state = const AsyncLoading()..copyWithPrevious(state);
      state = await AsyncValue.guard(() async {
        final id = DateTime.now().microsecondsSinceEpoch;
        Customer customer;
        final map = {
          'id': id,
          'name': name,
          'phoneNumber': phone,
          'vrn': vrn,
          'customerId': customerId,
          'idType': idType.name,
        };
        if (name.isNotEmpty) {
          await _box.add(map);
          customer = _customers.singleWhere((element) => element.id == id);
        } else {
          customer = Customer.fromMap(map);
        }
        return _CustomersState(customers: _customers, customer: customer);
      });
    }
  }

  void selectCustomer(Customer? customer) =>
      update((cb) => cb.copyWith(customer: customer));

  void delete(int index) async {
    if (state case AsyncData()) {
      state = const AsyncLoading()..copyWithPrevious(state);
      state = await AsyncValue.guard(() async {
        await _box.deleteAt(index);
        return _CustomersState(customers: _customers);
      });
    }
  }
}
