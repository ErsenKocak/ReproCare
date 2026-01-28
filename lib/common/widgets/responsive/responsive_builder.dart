import 'package:flutter/material.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/enums/app_screen_type/app_screen_type.dart';

class ResponsiveBuilder extends StatelessWidget {
  ResponsiveBuilder({
    super.key,
    this.mobile,
    this.tablet,
    this.laptop,
    this.miniDesktop,
    this.desktop,
    this.defaultWidget,
  });

  Widget? mobile;
  Widget? tablet;
  Widget? laptop;
  Widget? miniDesktop;
  Widget? desktop;
  Widget? defaultWidget;

  @override
  Widget build(BuildContext context) {
    return _getWidgetFromScreenType;
  }

  Widget get _getWidgetFromScreenType {
    AppScreenType screenType = AppScreenType.xs.getTypeFromWidth(
      width: MediaQuery.of(Application.context).size.width,
    );

    switch (screenType) {
      case AppScreenType.xs:
        return mobile ?? const SizedBox();
      case AppScreenType.sm:
        return tablet ?? defaultWidget ?? const SizedBox();
      case AppScreenType.md:
        return laptop ?? defaultWidget ?? const SizedBox();
      case AppScreenType.lg:
        return miniDesktop ?? defaultWidget ?? const SizedBox();
      case AppScreenType.xl:
        return desktop ?? defaultWidget ?? const SizedBox();
      case AppScreenType.xxl:
        return desktop ?? defaultWidget ?? const SizedBox();
    }
  }
}
