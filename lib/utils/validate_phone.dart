String? validatePhone(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Phone number cannot be empty';
  }
  if (phone.length != 9 || int.tryParse(phone) == null) {
    return 'Invalid phone number';
  }
  return null;
}
