extension ListUpdate<T> on List<T> {
  List<T> update(int pos, T t) {
    List<T> list = [];
    list.add(t);
    replaceRange(pos, pos + 1, list);
    return this;
  }
}

extension ListNullOrEmptyExtension on List? {
  bool get isNullOrEmpty {
    return this == null || this?.length == 0;
  }
}
