import 'package:flutter/material.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });
  final Future<void> Function() onRefresh;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
      color: AppLightColors.primaryColor,
      backgroundColor: AppLightColors.pink100,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
    );
  }
}
