import 'package:flutter/material.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/extensions/null_check/null_check_extension.dart';

enum AppScreenType {
  xs(576, "xs"), //Mobile
  sm(769, "sm"), //Tablet
  md(1200, "md"), //Laptop
  lg(1400, "lg"), //Desktop
  xl(1800, "xl"), //Large Desktop
  xxl(4000, "xxl"); //Extra Large Desktop

  bool get isMobile => this == AppScreenType.xs;

  bool get isTablet => this == AppScreenType.sm;

  bool get isLaptop => this == AppScreenType.md;

  bool get isMiniDesktop => this == AppScreenType.lg;

  bool get isDesktop => this == AppScreenType.xl;

  static List<AppScreenType> list = [
    AppScreenType.xs,
    AppScreenType.sm,
    AppScreenType.md,
    AppScreenType.lg,
    AppScreenType.xl,
    AppScreenType.xxl,
  ];

  const AppScreenType(this.width, this.className);

  final double width;

  final String className;
}

extension AppScreenTypeExtension on AppScreenType {
  AppScreenType getTypeFromWidth({double? width}) {
    if (width.isNull) {
      width = MediaQuery.of(Application.context).size.width;
    }
    for (var i in AppScreenType.values) {
      if (width! < i.width) {
        return i;
      }
    }
    return AppScreenType.xxl;
  }
}
