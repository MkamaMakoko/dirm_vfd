String? validateName(String? name) {
  if (name == null || name.isEmpty) {
    return 'Name cannot be empty';
  }
  if (name.length < 3) {
    return 'Name is too short';
  }
  return null;
}
