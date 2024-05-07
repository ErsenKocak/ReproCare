import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(AppLocalizationHelper.currentLocale);

  Future<void> changeLanguage(Locale locale) async {
    await AppLocalizationHelper.changeLocale(locale: locale);
    emit(locale);
  }
}
