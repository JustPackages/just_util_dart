extension JustStringExtension on String {
  /// If String Value's lower case is 'true', then return true.
  /// If String Value's lower case is 'false', then return false.
  bool? toBool() {
    bool? result;
    String validator = toLowerCase();

    if (validator == 'true') {
      result = true;
    } else if (validator == 'false') {
      result = false;
    }

    return result;
  }
}
