part of '../_.dart';

@freezed
class CustomersState with _$CustomersState {
  const CustomersState._();
  const factory CustomersState({
    @Default([]) List<Customer> customers,
    Customer? customer,
    // @Default('') String name,
    // @Default('') String phone,
    // @Default('') String id,
    // @Default('') String vrn,
    // @Default(IdType.tin) IdType idType,
  }) = _CustomersState;

  // String? get nameValidator => validateName(name);

  // String? get phoneValidator => validatePhone(phone);

  // String? get customerIdValidator {
  //   return switch (idType) {
  //     IdType.tin => validateTin(id),
  //     _ => id.isEmpty ? 'Customer ID cannot be empty' : null,
  //   };
  // }

  // String? get vrnValidator {
  //   if (vrn.isNotEmpty && vrn.length < 9) return 'VRN is too short';
  //   if (int.tryParse(vrn[8]) != null) {
  //     return 'Invalid VRN';
  //   }
  //   return null;
  // }

  // bool get canSubmit =>
  //     nameValidator == null &&
  //     phoneValidator == null &&
  //     customerIdValidator == null &&
  //     vrnValidator == null;
}
