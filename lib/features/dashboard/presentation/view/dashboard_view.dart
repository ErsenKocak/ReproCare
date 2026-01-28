import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/app_bar/custom_app_bar.dart';
import 'package:reprocare/common/widgets/responsive/responsive_builder.dart';
import 'package:reprocare/core/enums/app_screen_type/app_screen_type.dart';
import 'package:reprocare/features/dashboard/presentation/view/platforms/dashboard_mobile_view.dart';
import 'package:reprocare/features/dashboard/presentation/view/platforms/dashboard_web_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      backgroundColor: const Color(0xFFF9FAFB),
      body: _buildBody,
    );
  }

  get _buildAppBar {
    AppScreenType screenType = AppScreenType.lg.getTypeFromWidth();
    if (screenType != AppScreenType.xs) return null;

    return CustomAppBar(
      leading: const SizedBox(),
      title: 'Dashboard',
    );
  }

  Widget get _buildBody {
    return ResponsiveBuilder(
      mobile: DashboardMobileView(),
      defaultWidget: DashboardWebView(),
    );
  }
}
