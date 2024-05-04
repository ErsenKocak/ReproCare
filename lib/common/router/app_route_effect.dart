import 'package:flutter/material.dart';

enum AppRouteEffect {
  none,
  theme,
  fade,
  scale,
  rightToLeft,
  leftToRight,
  topToBottom,
  bottomToTop,
}

extension AppRouteEffectExtension on AppRouteEffect {
  static Offset _value(AppRouteEffect effect) {
    switch (effect) {
      case AppRouteEffect.rightToLeft:
        return const Offset(1.0, 0.0);
      case AppRouteEffect.leftToRight:
        return const Offset(-1.0, 0.0);
      case AppRouteEffect.topToBottom:
        return const Offset(0.0, -1.0);
      case AppRouteEffect.bottomToTop:
        return const Offset(0.0, 1.0);
      default:
        return const Offset(0.0, 0.0);
    }
  }

  Offset get value => _value(this);
}
