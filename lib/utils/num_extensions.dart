extension MultiplierFormat on num {
  String toMultiplier() {
    final str = toString();
    return 'x${str.contains('.') ? str : '$str.0'}';
  }
}
