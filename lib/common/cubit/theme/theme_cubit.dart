import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:reprocare/common/base/cubit/base_cubit.dart';
import 'package:reprocare/common/cache/cache_manager.dart';
import 'package:reprocare/common/cubit/theme/data/enums/theme_mode_enum.dart';
import 'package:reprocare/common/cubit/theme/theme_state_model.dart';
import 'package:reprocare/core/constants/cache/cache_constants.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

final class ThemeCubit extends Cubit<ThemeStateModel>
    with BaseCubit<ThemeStateModel> {
  ThemeCubit(this.cacheManager) : super(ThemeStateModel());

  final CacheManager cacheManager;

  late ThemeStateModel stateModel;

  ThemeData get themeData => _getThemeData;

  ThemeMode get themeMode => stateModel.themeMode.materialThemeMode;

  @override
  Future<void> initialize() async {
    stateModel = ThemeStateModel();
    ThemeStateModel? _themeResult = await _getThemeByCache();
    changeThemeWithParameter(_themeResult?.themeMode ?? stateModel.themeMode);
  }

  void changeThemeWithParameter(ThemeModeEnum themeMode) {
    if (stateModel.themeMode.name != themeMode.name) {
      stateModel = stateModel.copyWith(themeMode: themeMode);
      safeEmit(stateModel);
      _saveThemeForCache(themeMode);
    }
  }

  ThemeData get _getThemeData {
    if (stateModel.themeMode == ThemeModeEnum.Light) {
      return AppThemes.lightTheme;
    } else if (stateModel.themeMode == ThemeModeEnum.Dark) {
      return AppThemes.darkTheme;
    } else {
      Brightness brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark
          ? AppThemes.darkTheme
          : AppThemes.lightTheme;
    }
  }

  void _saveThemeForCache(ThemeModeEnum themeMode) => cacheManager.setObject(
        CacheConstants.Theme.name,
        ThemeStateModel(themeMode: themeMode),
      );

  Future<ThemeStateModel?> _getThemeByCache() async => await cacheManager
      .getObject(CacheConstants.Theme.name, ThemeStateModel.fromJson);
}
