enum AppMode { unknown, development, test, uat, production }

extension AppModeExtension on AppMode {
  String get path {
    switch (this) {
      case AppMode.development:
        return "development";
      case AppMode.test:
        return "test";
      case AppMode.uat:
        return "uat";
      case AppMode.production:
        return "production";
      default:
        return 'development';
    }
  }

  String get appTag {
    switch (this) {
      case AppMode.development:
        return "-DEV";
      case AppMode.test:
        return "-TEST";
      case AppMode.uat:
        return "-UAT";
      case AppMode.production:
        return "";
      case AppMode.unknown:
        return "-DEV";
    }
  }
}
