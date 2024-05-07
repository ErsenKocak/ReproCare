import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/cubit/language/language_cubit.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/widgets/switch/app_switch.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/generated/locale_keys.g.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';

class SettingsLanguageItem extends StatelessWidget {
  const SettingsLanguageItem({super.key, required this.locale});

  final Locale locale;

  @override
  Widget build(BuildContext context) {
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
            isChecked: locale == AppLocalizationHelper.currentLocale,
            onChanged: () async => await _onTapChangeLocale(),
          ),
        ],
      ),
    );
  }

  Widget get _buildLabelText {
    String labelText = '';
    if (locale == AppLocalizationHelper.tr) {
      labelText = LocaleKeys.Languages_Turkish.tr();
    } else if (locale == AppLocalizationHelper.en) {
      labelText = LocaleKeys.Languages_English.tr();
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

  Future<void> _onTapChangeLocale() async {
    if (locale != AppLocalizationHelper.currentLocale) {
      AppRouter.pop();
      await Future.delayed(
        Duration(milliseconds: 300),
        () async {
          await ServiceLocatorProvider.provide<LanguageCubit>()
              .changeLanguage(locale);
        },
      );
    }
  }
}
