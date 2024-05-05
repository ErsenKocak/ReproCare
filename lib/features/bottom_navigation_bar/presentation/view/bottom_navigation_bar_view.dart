import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/router/app_route_observer_mixin.dart';
import 'package:reprocare/common/widgets/svg_picture/app_svg_picture.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/features/bottom_navigation_bar/presentation/mixin/bottom_navigation_bar_mixin.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';
import 'package:stylish_bottom_bar/helpers/bottom_bar.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({required this.navigationShell, super.key});

  final Widget navigationShell;

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView>
    with BottomNavigationBarMixin, RouterObserverMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      resizeToAvoidBottomInset: false,
      body: widget.navigationShell,
      bottomNavigationBar: _buildBottomNavigationBar,
    );
  }

  Widget get _buildBottomNavigationBar {
    return ValueListenableBuilder(
      valueListenable: activeIndexNotifier,
      builder: (context, activeIndexNotifierValue, child) {
        return StylishBottomBar(
          backgroundColor:
              AppThemes.currentTheme.bottomNavigationBarTheme.backgroundColor,
          hasNotch: true,
          elevation: 12,
          currentIndex: activeIndexNotifierValue,
          option: _bottomBarOptions,
          items: _buildBottomBarItems,
          onTap: navigate,
        );
      },
    );
  }

  BottomBarOption get _bottomBarOptions {
    return AnimatedBarOptions(
      iconSize: 24.h,
      padding: EdgeInsets.only(top: 12.h),
    );
  }

  List<BottomBarItem> get _buildBottomBarItems {
    final bottomBarItems = <BottomBarItem>[
      _buildBottomBarItem(
        unSelectedIconPath: Assets.icons.general.iconAppBarNotification.path,
        selectedIconPath: Assets.icons.general.iconAppBarNotification.path,
        title: LocaleKeys.BottomNavigationBar_Home.tr(),
        viewIndex: 0,
      ),
      _buildBottomBarItem(
        unSelectedIconPath: Assets.icons.bottomNavigationBar.iconSettings.path,
        selectedIconPath: Assets.icons.bottomNavigationBar.iconSettings.path,
        title: LocaleKeys.BottomNavigationBar_Profile.tr(),
        viewIndex: 1,
      ),
    ];

    return bottomBarItems;
  }

  BottomBarItem _buildBottomBarItem({
    required String unSelectedIconPath,
    required String selectedIconPath,
    required String title,
    required int viewIndex,
  }) {
    return BottomBarItem(
      icon: AppSvgPicture(
        path: unSelectedIconPath,
        height: 20.h,
        color:
            AppThemes.currentTheme.bottomNavigationBarTheme.unselectedItemColor,
        onTap: () => navigate(viewIndex),
      ),
      selectedIcon: AppSvgPicture(
        path: selectedIconPath,
        height: 20.h,
        color:
            AppThemes.currentTheme.bottomNavigationBarTheme.selectedItemColor,
      ),
      unSelectedColor:
          AppThemes.currentTheme.bottomNavigationBarTheme.unselectedItemColor!,
      selectedColor:
          AppThemes.currentTheme.bottomNavigationBarTheme.selectedItemColor!,
      title: Text(''),

      // title:
      //     Padding(
      //       padding: const EdgeInsets.all(8),
      //       child: Text(
      //         title,
      //         // style: AppTextStyles.body12Medium,
      //         style: AppThemes.currentTheme.textTheme.bodySmall?.copyWith(
      //           color: viewIndex == activeIndexNotifier.value
      //               ? AppLightColors.primary
      //               : null,
      //         ),
      //       ),
      //     ),
    );
  }

  @override
  void didPop() {}

  @override
  void didPopNext() {}

  @override
  void didPush() {}

  @override
  void didPushNext() {}
}
