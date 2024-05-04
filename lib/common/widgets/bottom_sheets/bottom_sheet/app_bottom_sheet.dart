import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/generated/assets.gen.dart';

class AppBottomSheet {
  static Future<T?> show<T>({
    required final Widget Function(BuildContext bottomSheetContext) child,
    final String? title,
    final EdgeInsetsGeometry? contentPadding,
    final double? bottomPadding,
    final bool? isFullScreen = false,
    final Color? backgroundColor,
    final Widget? titlePrefix,
    final Widget? titleSuffix,
    final bool? useSafeArea = true,
    final EdgeInsetsGeometry? titleMargin,
  }) async {
    return showModalBottomSheet<T>(
      context: Application.applicationContext,
      useSafeArea: useSafeArea!,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: backgroundColor != null
          ? backgroundColor
          : AppThemes.brightness == Brightness.light
              ? AppLightColors.white
              : AppDarkColors.secondaryDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (final BuildContext bottomSheetContext) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: titleMargin ??
                  EdgeInsets.only(
                    top: 15.h,
                    right: 16.w,
                    left: 16.w,
                  ),
              decoration: BoxDecoration(
                color: AppLightColors.strokeGrey,
                borderRadius: BorderRadius.circular(2),
              ),
              width: 28.w,
              height: 4.h,
            ),
          ),
          _bottomSheetHeader(
            title: title,
            titlePrefix: titlePrefix,
            titleSuffix: titleSuffix,
            titleMargin: titleMargin,
          ),
          5.h.sbxh,
          _buildBody(
            context: bottomSheetContext,
            child: child(bottomSheetContext),
            bottomPadding: bottomPadding,
            contentPadding: contentPadding,
            isFullScreen: isFullScreen,
          ),
        ],
      ),
    );
  }

  static Widget _buildBody({
    required BuildContext context,
    required final Widget child,
    final EdgeInsetsGeometry? contentPadding,
    final double? bottomPadding,
    final bool? isFullScreen,
  }) {
    if (isFullScreen == true) {
      return Expanded(
        child: SingleChildScrollView(
          child: _buildChild(
            context: context,
            child: child,
            bottomPadding: bottomPadding,
            contentPadding: contentPadding,
          ),
        ),
      );
    } else {
      return _buildChild(
        context: context,
        child: child,
        bottomPadding: bottomPadding,
        contentPadding: contentPadding,
      );
    }
  }

  static Widget _bottomSheetHeader({
    final String? title,
    final Widget? titlePrefix,
    final Widget? titleSuffix,
    final EdgeInsetsGeometry? titleMargin,
  }) {
    return Container(
      margin: titleMargin ??
          EdgeInsets.only(
            right: 16.w,
            left: 16.w,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title != null
                  ? titlePrefix ??
                      Assets.icons.bottomSheet.iconClose
                          .svg(color: Colors.transparent, height: 25.h)
                  : const SizedBox(),
              title != null
                  ? Text(
                      title,
                      style: AppThemes.currentTheme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: AppFontWeight.medium.value),
                    )
                  : const SizedBox(),
              titleSuffix ??
                  GestureDetector(
                    onTap: () => AppRouter.pop(),
                    child: Assets.icons.bottomSheet.iconClose.svg(
                      color: AppThemes.brightness == Brightness.light
                          ? AppLightColors.lightGrey
                          : null,
                      height: 25.h,
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildChild({
    required BuildContext context,
    required final Widget child,
    final EdgeInsetsGeometry? contentPadding,
    final double? bottomPadding,
  }) {
    return Padding(
      padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          15.0.h.sbxh,
          child,
          SizedBox(
            height: bottomPadding ?? MediaQuery.of(context).padding.bottom,
          ),
        ],
      ),
    );
  }
}
