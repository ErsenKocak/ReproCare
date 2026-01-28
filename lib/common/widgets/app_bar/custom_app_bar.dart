import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/widgets/text/app_text.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.subTitle,
    this.actions,
    this.centerTitle,
    this.backgroundColor,
    this.elevation,
    this.automaticallyImplyLeading,
    this.leadingWidth,
    this.titleSpacing,
    this.flexibleSpace,
    this.bottom,
    this.toolbarHeight,
    this.onBackPressed,
  });

  final Widget? leading;
  final dynamic title;
  final String? subTitle;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Color? backgroundColor;
  final double? elevation;
  final bool? automaticallyImplyLeading;
  final double? leadingWidth;
  final double? titleSpacing;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemes.currentTheme;
    final shouldShowBackButton = automaticallyImplyLeading ?? true;
    final hasLeading = leading != null || shouldShowBackButton;
    final isCentered = centerTitle ?? false;

    return AppBar(
      backgroundColor: backgroundColor ?? theme.appBarTheme.backgroundColor,
      elevation: elevation ?? 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: false, // Always false, we handle centering manually
      leadingWidth: leadingWidth ?? 60,
      titleSpacing: titleSpacing ?? (isCentered ? 0 : 8.w),
      toolbarHeight: toolbarHeight ?? kToolbarHeight,
      leading: hasLeading ? _buildLeading(context) : null,
      title:
          (isCentered && flexibleSpace == null) ? null : _buildTitle(context),
      actions: _buildActions(context),
      flexibleSpace: isCentered ? _buildCenteredTitle(context) : flexibleSpace,
      bottom: bottom,
    );
  }

  Widget? _buildCenteredTitle(BuildContext context) {
    // If user provided flexibleSpace, use it and show title in title parameter
    if (flexibleSpace != null) {
      return flexibleSpace;
    }

    // Otherwise, center the title in flexibleSpace (horizontally and vertically)
    final titleWidget = _buildTitle(context);
    if (titleWidget == null) return null;

    // Get toolbar height and status bar height to properly center the title
    final toolbarHeight = this.toolbarHeight ?? kToolbarHeight;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: SizedBox(
        height: toolbarHeight,
        child: Align(
          child: titleWidget,
        ),
      ),
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (leading != null) {
      return Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: leading,
      );
    }

    if (automaticallyImplyLeading ?? true) {
      return _buildDefaultBackButton(context);
    }

    return null;
  }

  Widget _buildDefaultBackButton(BuildContext context) {
    final theme = AppThemes.currentTheme;
    return GestureDetector(
      onTap: onBackPressed ?? () => AppRouter.pop(),
      child: Container(
        margin: EdgeInsets.all(8.r),
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          LucideIcons.arrow_left,
          size: 20.sp,
          color: theme.iconTheme.color,
        ),
      ),
    );
  }

  Widget? _buildTitle(BuildContext context) {
    if (title == null) return null;

    if (title is Widget) {
      return title as Widget;
    }

    if (title is String) {
      final titleString = title as String;

      if (subTitle != null && subTitle!.isNotEmpty) {
        return _buildTitleWithSubtitle(titleString, subTitle!);
      }

      return _buildSimpleTitle(titleString);
    }

    return null;
  }

  Widget _buildSimpleTitle(String titleText) {
    return Align(
      alignment: centerTitle ?? false ? Alignment.center : Alignment.centerLeft,
      child: AppText.bodyMedium(
        titleText,
        fontWeight: AppFontWeight.bold,
      ),
    );
  }

  Widget _buildTitleWithSubtitle(String titleText, String subtitleText) {
    final isCentered = centerTitle ?? false;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: AppText.bodyMedium(
            titleText.trim(),
            fontWeight: AppFontWeight.bold,
            textAlign: isCentered ? TextAlign.center : TextAlign.left,
          ),
        ),
        4.sbxh,
        SizedBox(
          width: double.infinity,
          child: AppText.bodySmall(
            subtitleText,
            color: Colors.grey[600],
            fontWeight: AppFontWeight.regular,
            textAlign: isCentered ? TextAlign.center : TextAlign.left,
          ),
        ),
      ],
    );
  }

  List<Widget>? _buildActions(BuildContext context) {
    if (actions == null || actions!.isEmpty) return null;

    return [
      Padding(
        padding: EdgeInsets.only(right: 4.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: actions!
              .map(
                (action) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: action,
                ),
              )
              .toList(),
        ),
      ),
    ];
  }

  @override
  Size get preferredSize {
    final height = toolbarHeight ?? kToolbarHeight;
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(height + bottomHeight);
  }
}
