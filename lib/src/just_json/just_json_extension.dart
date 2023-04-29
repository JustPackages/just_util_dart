import 'dart:convert';

typedef JustJson = Map<String, dynamic>;

extension JustJsonExtension on JustJson {
  /// If val is not null, add property.
  void setIfPresent({required String key, dynamic val, dynamic defaultVal}) {
    if (val != null) {
      addAll({key: val});
    } else if (defaultVal != null) {
      addAll({key: defaultVal});
    }
  }

  /// If map contains key, return value.
  /// Else return defaultValue.
  dynamic getIfPresent({required String key, dynamic defaultVal}) {
    return containsKey(key) ? this[key] ?? defaultVal : defaultVal;
  }
}

extension JustJsonConverterExtension on JustJson {
  /// Make pretty Json with Indent.
  String toPrettyJsonString({int indentSize = 2}) {
    JsonEncoder encoder = JsonEncoder.withIndent(' ' * indentSize);
    String prettyJson = encoder.convert(this);

    return prettyJson;
  }
}
