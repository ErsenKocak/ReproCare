import 'package:extended_image/extended_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:reprocare/common/functions/app/app_functions.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/features/settings/domain/entities/response/user_settings_entity/user_settings_entity.dart';
import 'package:reprocare/features/settings/presentation/cubit/user_settings_cubit.dart';

class AppBarCircleAvatarLeading extends StatelessWidget {
  AppBarCircleAvatarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSettingsCubit, UserSettingsState>(
      builder: (context, state) => state.when(
        initial: () => const SizedBox(),
        loading: () => const SizedBox(),
        error: (final String errorMessage) => const SizedBox(),
        success: () => _buildUserAvatar(userSettingsCubit.userSettings),
      ),
    );
  }

  Widget _buildUserAvatar(UserSettingsEntity? userSettingsEntity) {
    return userSettingsEntity?.user?.photoUrl != null &&
            userSettingsEntity?.user?.photoUrl != ''
        ? _buildUserPhoto(userSettingsEntity)
        : _buildUserFirstLetterNameAndSurname(userSettingsEntity);
  }

  Widget _buildUserPhoto(UserSettingsEntity? userSettingsEntity) {
    return CircleAvatar(
      radius: 75.w,
      backgroundImage: ExtendedNetworkImageProvider(
        userSettingsEntity!.user!.photoUrl!,
        cache: true,
        imageCacheName: userSettingsEntity.user!.photoUrl!,
        cacheMaxAge: Duration(days: 3),
      ),
    );
  }

  Widget _buildUserFirstLetterNameAndSurname(
    UserSettingsEntity? userSettingsEntity,
  ) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      height: 75.h,
      width: 75.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.transparent,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        color: AppLightColors.primaryColor,
      ),
      child: Text(
        AppFunctions.getFirstLetterNameAndSurname(
          '${userSettingsEntity?.user?.name} ${userSettingsEntity?.user?.surname}',
        ),
        style: AppThemes.currentTheme.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: AppFontWeight.semiBold.value,
        ),
      ),
    );
  }
}
