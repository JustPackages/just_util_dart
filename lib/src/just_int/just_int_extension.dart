extension JustIntExtension on int {
  String toStringAtLeat2Digits() {
    return this < 10 ? '0$this' : toString();
  }

  /// If Int Value is 0, then return false.
  /// If Int Value is not 0, then return true.
  bool? toBool() {
    return this == 0 ? false : true;
  }
}
