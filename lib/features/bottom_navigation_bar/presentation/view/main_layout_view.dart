import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprocare/features/bottom_navigation_bar/presentation/view/bottom_navigation_bar_view.dart';
import 'package:reprocare/features/bottom_navigation_bar/presentation/view/platforms/main_web_layout.dart';

class MainLayoutView extends StatelessWidget {
  final Widget navigationShell;

  const MainLayoutView({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return MainWebLayout(navigationShell: navigationShell);
    } else {
      return BottomNavigationBarView(navigationShell: navigationShell);
    }
  }
}
