import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/features/settings/presentation/widgets/settings_list_item/data/entities/list_tile_item.dart';

class ListTileItemWidget extends StatelessWidget {
  const ListTileItemWidget({super.key, required this.item, this.margin});
  final ListTileItem item;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => item.onTap != null ? item.onTap!() : null,
      child: Container(
        margin: margin ?? EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: AppThemes.brightness == Brightness.light
              ? AppLightColors.white
              : AppDarkColors.secondaryDarkColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: item.leadingWidget,
          title: Text(
            item.title,
            style: AppThemes.currentTheme.textTheme.bodyMedium,
          ),
          trailing: item.trailingWidget ??
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12.h,
                color: AppThemes.currentTheme.textTheme.labelSmall?.color,
              ),
        ),
      ),
    );
  }
}
