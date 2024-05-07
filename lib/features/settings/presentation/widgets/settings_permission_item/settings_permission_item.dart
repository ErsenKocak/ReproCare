import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/switch/app_switch.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_settings_entity.dart';
import 'package:reprocare/features/settings/domain/enums/permission_type.dart';
import 'package:reprocare/features/settings/presentation/cubit/user_settings_cubit.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class SettingsPermissionItem extends StatelessWidget {
  const SettingsPermissionItem({
    super.key,
    required this.permissionType,
    required this.isActive,
    required this.onChange,
  });

  final PermissionType permissionType;
  final bool isActive;
  final Function() onChange;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSettingsCubit, UserSettingsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: AppThemes.brightness == Brightness.light
                ? Colors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: _boxShadow,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLabelText,
              AppSwitch(
                isChecked: isActive,
                onChanged: () async => onChange(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget get _buildLabelText {
    String labelText = '';
    if (permissionType == PermissionType.Notification) {
      labelText = LocaleKeys.Settings_AllowNotifications.tr();
    }

    return Text(
      labelText,
      style: AppThemes.currentTheme.textTheme.bodySmall,
    );
  }

  List<BoxShadow>? get _boxShadow {
    if (AppThemes.brightness == Brightness.light) {
      return [
        BoxShadow(
          color: AppLightColors.lightGrey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 4,
        ),
      ];
    }

    return null;
  }
}
