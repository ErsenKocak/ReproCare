import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

final class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    this.leading,
    this.titleText = '',
    this.actions,
    this.centerTitle = true,
    this.leadingWidth,
    this.titleWidget,
    this.height = 0,
    this.backgroundColor,
  });

  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Widget? titleWidget;
  final String? titleText;
  final double? leadingWidth;
  final double? height;
  final Color? backgroundColor;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + height!);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  void initState() {
    super.initState();
    // widget.leading ??= AppBarCircleAvatarLeading();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: true,
      centerTitle: widget.centerTitle,
      titleSpacing: 10.w,
      leading: _leading,
      leadingWidth: widget.leadingWidth ?? 35.w,
      title: _title,
      toolbarHeight: 100,
      actions: widget.actions != null
          ? [
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Row(
                  children: widget.actions!,
                ),
              ),
            ]
          : null,
    );
  }

  Widget get _leading {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: widget.leading,
    );
  }

  Widget? get _title {
    if (widget.titleText!.isNotEmpty) {
      return Text(
        widget.titleText!,
        style: AppThemes.currentTheme.textTheme.bodyLarge?.copyWith(
          fontWeight: AppFontWeight.medium.value,
          overflow: TextOverflow.visible,
        ),
      );
    } else if (widget.titleWidget != null) {
      return widget.titleWidget!;
    }
    return null;
  }
}
