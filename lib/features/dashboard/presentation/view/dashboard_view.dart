import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/app_bar/app_bar_widget.dart';
import 'package:reprocare/common/widgets/responsive/responsive_builder.dart';
import 'package:reprocare/features/dashboard/presentation/view/platforms/dashboard_mobile_view.dart';
import 'package:reprocare/features/dashboard/presentation/view/platforms/dashboard_web_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        titleText: 'Dashboard',
      ),
      // Background color might need adjustment for web vs mobile
      backgroundColor: const Color(0xFFF9FAFB),
      body: const ResponsiveBuilder(
        mobile: DashboardMobileView(),
        web: DashboardWebView(),
      ),
    );
  }
}
