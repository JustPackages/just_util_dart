extension JustListExtension on List {
  /// If given list's type is List<int> and empty, then return Range List.
  /// The Range List starts with 0(default) and finish with 'finish' value.
  List<int> makeRange(int finish, {int start = 0}) {
    assert(runtimeType == List<int>, "The List's type is not List<int>.");
    assert(length == 0, "The List is not empty.");

    for (int i = start; i <= finish; i++) {
      add(i);
    }

    return this as List<int>;
  }
}
