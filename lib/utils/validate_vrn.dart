String? validateVRN(String? vrn) {
  if (vrn != null && vrn.isNotEmpty) {
    if (vrn.length < 9) {
      return 'Invalid VRN';
    }
  }
  return null;
}
