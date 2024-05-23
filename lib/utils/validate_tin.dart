String? validateTin(String? tin) {
  if (tin == null || tin.isEmpty) return 'TIN cannot be empty';
  if (tin.length != 9) return 'Invalid TIN';
  return null;
}
