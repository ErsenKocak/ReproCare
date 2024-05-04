import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/common/base/cubit/base_state.dart';
import 'package:reprocare/common/cubit/theme/data/enums/theme_mode_enum.dart';

part 'theme_state_model.freezed.dart';
part 'theme_state_model.g.dart';

@Freezed(equal: false)
class ThemeStateModel with _$ThemeStateModel implements BaseState {
  factory ThemeStateModel({
    @Default(ThemeModeEnum.System) ThemeModeEnum themeMode,
  }) = _ThemeStateModel;

  factory ThemeStateModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateModelFromJson(json);
}
