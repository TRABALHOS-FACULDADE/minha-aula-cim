extension ValidRA on String {
  bool get isValidRA => RegExp(r'^\d{3}\.\d{6}$').hasMatch(this);
}
