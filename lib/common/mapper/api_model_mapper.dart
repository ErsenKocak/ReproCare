class APIModelMapper {
  static List<T> jsonToList<T>(
    dynamic json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    return json.map((e) => fromJson(e)).toList().cast<T>();
  }
}
