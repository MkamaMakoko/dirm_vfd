String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password cannot be empty';
  }
  if (password.length < 6) {
    return 'Password is too short';
  }
  return null;
}
