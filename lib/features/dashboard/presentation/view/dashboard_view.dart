import 'package:flutter/material.dart';
import 'package:reprocare/common/widgets/app_bar/custom_app_bar.dart';
import 'package:reprocare/common/widgets/responsive/responsive_builder.dart';
import 'package:reprocare/common/widgets/text/app_text.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/enums/app_screen_type/app_screen_type.dart';
import 'package:reprocare/features/dashboard/presentation/view/mixins/dashboard_view_mixin.dart';
import 'package:reprocare/features/dashboard/presentation/view/platforms/dashboard_mobile_view.dart';
import 'package:reprocare/features/dashboard/presentation/view/platforms/dashboard_web_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with DashboardViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      backgroundColor: const Color(0xFFF9FAFB),
      body: _buildBody,
    );
  }

  PreferredSizeWidget? get _buildAppBar {
    AppScreenType screenType = AppScreenType.lg.getTypeFromWidth();
    if (screenType != AppScreenType.xs) return null;

    return CustomAppBar(
      leading: const SizedBox(),
      // title: 'Dashboard',
      title: Container(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.titleMedium(
              'İzleme ve Kontrol Paneli',
              fontWeight: AppFontWeight.bold,
            ),
            const SizedBox(height: 4),
            AppText.bodySmall(
              'Gerçek zamanlı sistem genel bakışı',
              color: AppLightColors.secondaryTextColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildBody {
    return ResponsiveBuilder(
      mobile: DashboardMobileView(
        labs: labs,
        onDeviceMoved: (d, s, t, [idx]) => onDeviceMoved(d, s, t, idx),
      ),
      defaultWidget: DashboardWebView(
        labs: labs,
        onDeviceMoved: (d, s, t, [idx]) => onDeviceMoved(d, s, t, idx),
      ),
    );
  }
}
