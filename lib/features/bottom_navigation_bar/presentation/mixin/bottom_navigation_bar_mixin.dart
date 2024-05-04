import 'package:flutter/material.dart';
import 'package:reprocare/common/base/mixin/base_mixin.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/router/app_routes.dart';
import 'package:reprocare/features/bottom_navigation_bar/presentation/view/bottom_navigation_bar_view.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';

mixin BottomNavigationBarMixin on State<BottomNavigationBarView>
    implements BaseMixin {
  late ValueNotifier<int> activeIndexNotifier;

  @override
  void initState() {
    super.initState();
    initializeMixin();
    initializeServices();
  }

  @override
  void dispose() {
    disposeMixin();
    super.dispose();
  }

  @override
  Future<void> initializeMixin() async {
    activeIndexNotifier = ValueNotifier<int>(0);

    await AppLocalizationHelper.initialize();
  }

  @override
  Future<void> initializeServices() async {}

  @override
  Future<void> disposeMixin() async {}

  void navigate(int index) {
    var bottomNavigatorRoute = '';
    activeIndexNotifier.value = index;
    switch (index) {
      case 0:
        bottomNavigatorRoute = AppRoutes.Home.path;
      case 1:
        bottomNavigatorRoute = AppRoutes.Settings.path;
    }
    //TODO
    // FirebaseAnalyticsHelper.logScreenView(bottomNavigatorRoute);
    AppRouter.goNamed(bottomNavigatorRoute);
  }
}
