import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:reprocare/common/cache/cache_manager.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/common/logger/app_logger.dart';
import 'package:reprocare/common/router/app_route_effect.dart';
import 'package:reprocare/common/router/app_route_observer_mixin.dart';
import 'package:reprocare/common/router/app_routes.dart';
import 'package:reprocare/common/router/transition_builder.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/features/bottom_navigation_bar/presentation/view/main_layout_view.dart';
import 'package:reprocare/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:reprocare/features/login/presentation/view/login_view.dart';
import 'package:reprocare/features/notification/presentation/view/notifications_view.dart';
import 'package:reprocare/features/notification_settings/presentation/view/notification_settings_view.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_entity.dart';
import 'package:reprocare/features/settings/presentation/views/settings_view.dart';
import 'package:reprocare/helper/firebase/analytics/firebase_analytics_helper.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: Application.navigatorKey,
    initialLocation: AppRoutes.Dashboard.path,
    observers: [
      appRouteObserver,
      if (!kIsWeb && (Platform.isAndroid || Platform.isIOS))
        FirebaseAnalyticsHelper.navigatorObserver,
      ChuckerFlutter.navigatorObserver,
    ],
    debugLogDiagnostics: false,
    routes: [
      ShellRoute(
        navigatorKey: Application.shellNavigatorKey,
        builder: (context, state, navigationShell) {
          return MainLayoutView(
            navigationShell: navigationShell,
          );
        },
        routes: [
          _generateGoRoute(
            route: AppRoutes.Dashboard.path,
            isShellRoute: true,
            view: (parameter) => DashboardView(),
            routeEffect: AppRouteEffect.none,
          ),
          _generateGoRoute(
            route: AppRoutes.Notification.path,
            isShellRoute: true,
            view: (parameter) => NotificationsView(),
            routeEffect: AppRouteEffect.none,
          ),
          _generateGoRoute(
              route: AppRoutes.Settings.path,
              isShellRoute: true,
              view: (parameter) => SettingsView(),
              routeEffect: AppRouteEffect.none,
              subRoutes: [
                _generateGoRoute(
                  route: AppRoutes.NotificationSettings.path,
                  isShellRoute: true,
                  view: (parameter) => NotificationSettingsView(),
                ),
              ]),
        ],
      ),
      _generateGoRoute(
        route: AppRoutes.Login.path,
        view: (parameter) => LoginView(),
        routeEffect: AppRouteEffect.none,
      ),
    ],
    redirect: (context, state) async {
      AppLogger.call(title: 'Go Router Redirect', value: state.matchedLocation);

      if (state.matchedLocation == AppRoutes.Login.path) {
        final CacheManager cacheManager =
            ServiceLocatorProvider.provide<CacheManager>();

        final _loginEntity = await cacheManager.getObject(
            CacheConstants.User.name, UserEntity.fromJson);

        if (_loginEntity != null) {
          return AppRoutes.Dashboard.path;
        }
      }
      FirebaseAnalyticsHelper.logScreenView(state.matchedLocation);

      return null;
    },
  );

  static GoRoute
      _generateGoRoute<View extends Widget, Parameter extends Object>({
    required String route,
    required View view(Parameter? parameter),
    List<SingleChildWidget>? blocProviders,
    List<RouteBase>? subRoutes,
    AppRouteEffect? routeEffect,
    bool isShellRoute = false,
  }) {
    GlobalKey<NavigatorState>? parentNavigatorKey = isShellRoute == true
        ? Application.shellNavigatorKey
        : Application.navigatorKey;

    return GoRoute(
      name: route,
      path: route,
      parentNavigatorKey: parentNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        Parameter? argumentExtra = state.extra as Parameter?;

        Widget child = blocProviders != null
            ? MultiBlocProvider(
                providers: blocProviders,
                child: view(argumentExtra),
              )
            : view(argumentExtra);

        if (routeEffect != null) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: child,
            transitionDuration: Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return PageRouteTransitionBuilder.transitionsBuilder(
                context,
                animation,
                secondaryAnimation,
                child,
                effect: routeEffect,
              );
            },
          );
        } else {
          return MaterialPage(child: child);
        }
      },
      routes: subRoutes ?? [],
    );
  }

  static goNamed(String routeName, {Object? extra}) {
    router.goNamed(routeName, extra: extra);
  }

  static Future<bool?> navigatePushNamed(
    String routeName, {
    Object? extra,
  }) async {
    return router.pushNamed(routeName, extra: extra ?? null);
  }

  static navigatePushReplacementNamed(String routeName, {Object? extra}) {
    router.pushReplacementNamed(routeName);
  }

  static pop({dynamic value}) {
    return router.pop(value);
  }

  static String? currentRoute(BuildContext context) =>
      GoRouterState.of(context).name;
}
