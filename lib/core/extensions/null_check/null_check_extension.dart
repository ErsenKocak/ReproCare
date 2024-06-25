extension CustomObjectNullCheckExtension on Object? {
  bool get isNotNull {
    return this != null;
  }

  bool get isNull {
    return this == null;
  }
}

extension ListNullOrEmptyExtension on List? {
  bool get isNullOrEmpty {
    return this == null || this?.length == 0;
  }

  bool get isNotNullAndEmpty {
    return this != null && this?.length != 0;
  }
}

extension StringNullOrEmptyExtension on String? {
  bool get isNullOrEmpty {
    return this == null || this?.length == 0;
  }

  bool get isNotNullAndEmpty {
    return this != null && this?.length != 0;
  }
}

extension MapNullOrEmptyExtension on Map? {
  bool get isNullOrEmpty {
    return this == null || this?.length == 0;
  }

  bool get isNotNullOrEmpty {
    return this != null && this?.length != 0;
  }
}
