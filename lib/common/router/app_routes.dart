import 'package:collection/collection.dart';

enum AppRoutes {
  // ----------- AUTH PAGES -----------
  Login('/login'),
  // ----------- BOTTOM NAVIGATION PAGES -----------
  Dashboard('/dashboard'),
  Onboarding('/onboarding'),
  Notification('/notification'),
  // ----------- SETTINGS PAGES -----------
  Profile('/profile'),
  Settings('/settings'),
  NotificationSettings('notificationSettings'),
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
