import 'package:collection/collection.dart';

enum AppRoutes {
  Onboarding('/onboarding'),
  Notification('/notification'),
  Login('/login'),
  Profile('/profile'),
  Settings('/settings'),
  AboutUs('/aboutus');

  const AppRoutes(this.path);
  final String path;
}

extension AppRoutesStringExtension on String {
  AppRoutes get getAppRoute {
    AppRoutes? appRoute =
        AppRoutes.values.firstWhereOrNull((route) => route.path == this) ??
            AppRoutes.Notification;

    return appRoute;
  }
}
