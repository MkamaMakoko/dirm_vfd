import 'package:dirm_vfd/objects/_.dart';

String?  validateCustomerId({required String? id, required IdType type}) {
    return switch (type) {
      IdType.tin => validateTin(id),
      _ => id==null|| id.isEmpty ? 'Customer ID cannot be empty' : null,
    };
  }

  String? validateTin(String? tin) {
  if (tin == null || tin.isEmpty) return 'TIN cannot be empty';
  if (tin.length != 9) return 'Invalid TIN';
  return null;
}