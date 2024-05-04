import 'package:easy_localization/easy_localization.dart';
import 'package:reprocare/core/enums/date/date_format_types.dart';
import 'package:reprocare/generated/locale_keys.g.dart';
import 'package:reprocare/helper/localization/localization_helper.dart';

class DateFunctions {
  static String? dateFormat({
    required DateTime dateTime,
    DateFormatTypes? dateFormat = DateFormatTypes.ddMMyyyy,
  }) {
    String dateFormatResult = DateFormat(
      dateFormat!.format,
      AppLocalizationHelper.currentLocale.languageCode.toLowerCase(),
    ).format(dateTime);
    return dateFormatResult;
  }

  static DateTime stringToDateTime({
    required String? stringDate,
    DateFormatTypes? dateFormat = DateFormatTypes.ddMMyyyy,
  }) {
    if (stringDate == null || stringDate.length == 0) DateTime.now();

    stringDate = stringDate!.replaceAll('T', ' ');

    DateTime dateFormatResult =
        DateFormat(dateFormat!.format).parse(stringDate);
    return dateFormatResult;
  }

  static bool isEqualStringAndDate({
    required String stringDate,
    required DateTime date,
  }) {
    String formattedDate = dateFormat(dateTime: date)!;
    String taskDate = dateFormat(
      dateTime: stringToDateTime(stringDate: stringDate),
    )!;

    return formattedDate == taskDate ? true : false;
  }

  /// Eğer parametre vermezsek haftanın başlangıç gününü Pazartesi olarak başlatıyor
  /// Eğer parametre verirsek hafta başlangıcını verdiğimiz parametre gününe göre güncelleyip
  /// geriye kalan tüm günleri ona göre sıralıyor.
  static List<DateTime> getWeekDays({int? startWeekDay = DateTime.monday}) {
    List<DateTime> weekDays = [];
    weekDays.clear();
    DateTime d = DateTime.now();

    DateTime firstDayOfWeek = d.subtract(
      new Duration(
        days: (d.weekday - startWeekDay!),
      ),
    );
    for (var i = 0; i <= 6; i++) {
      DateTime newDate = firstDayOfWeek.add(Duration(days: i));
      weekDays.add(newDate);
    }

    return weekDays;
  }

  static String getWeekDayName(int day, {bool isShortName = false}) {
    if (isShortName) {
      if (day == DateTime.monday)
        return LocaleKeys.Date_mon.tr();
      else if (day == DateTime.tuesday)
        return LocaleKeys.Date_tue.tr();
      else if (day == DateTime.wednesday)
        return LocaleKeys.Date_wed.tr();
      else if (day == DateTime.thursday)
        return LocaleKeys.Date_thur.tr();
      else if (day == DateTime.friday)
        return LocaleKeys.Date_fri.tr();
      else if (day == DateTime.saturday)
        return LocaleKeys.Date_sat.tr();
      else if (day == DateTime.sunday) return LocaleKeys.Date_sun.tr();
    } else {
      if (day == DateTime.monday)
        return LocaleKeys.Date_monday.tr();
      else if (day == DateTime.tuesday)
        return LocaleKeys.Date_tuesday.tr();
      else if (day == DateTime.wednesday)
        return LocaleKeys.Date_wednesday.tr();
      else if (day == DateTime.thursday)
        return LocaleKeys.Date_thursday.tr();
      else if (day == DateTime.friday)
        return LocaleKeys.Date_friday.tr();
      else if (day == DateTime.saturday)
        return LocaleKeys.Date_saturday.tr();
      else if (day == DateTime.sunday) return LocaleKeys.Date_sunday.tr();
    }

    return '';
  }

  static int getWeekDayIntValue({required String dayName}) {
    if (dayName == LocaleKeys.Date_monday.tr()) {
      return DateTime.monday;
    } else if (dayName == LocaleKeys.Date_tuesday.tr()) {
      return DateTime.tuesday;
    } else if (dayName == LocaleKeys.Date_wednesday.tr()) {
      return DateTime.wednesday;
    } else if (dayName == LocaleKeys.Date_thursday.tr()) {
      return DateTime.thursday;
    } else if (dayName == LocaleKeys.Date_friday.tr()) {
      return DateTime.friday;
    } else if (dayName == LocaleKeys.Date_saturday.tr()) {
      return DateTime.saturday;
    } else {
      return DateTime.sunday;
    }
  }

  static List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }

    return days;
  }

  static List<DateTime> getYearsInBetween(
      DateTime startDate, DateTime endDate) {
    List<DateTime> years = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays ~/ 365; i++) {
      years.add(startDate.copyWith(year: startDate.year + i));
    }

    return years;
  }

  /// Başlangıç ve Bitiş Aylarını dahil ederek aradaki ayları alır
  static List<DateTime> getMonthsInBetween(
      DateTime startDate, DateTime endDate) {
    List<DateTime> months = [];
    int totalDays = endDate.difference(startDate).inDays;
    int years = totalDays ~/ 365;
    int monthDifference = (totalDays - years * 365) ~/ 30;

    for (int i = 0; i < monthDifference; i++) {
      final date = startDate.copyWith(month: startDate.month + i);
      if (months.contains(date) == false) {
        months.add(date);
      }
    }

    return months;
  }

  /// Başlangıç ve Bitiş Aylarını dahil etmeden aradaki ayları alır
  static List<DateTime> getMonthsDifference(
      DateTime startDate, DateTime endDate) {
    List<DateTime> months = [];
    int totalDays = endDate.difference(startDate).inDays;
    int years = totalDays ~/ 365;
    int monthDifference = (totalDays - years * 365) ~/ 30;

    for (int i = 1; i < monthDifference; i++) {
      months.add(startDate.copyWith(month: startDate.month + i));
    }

    return months;
  }

  static String getMonthName(month, {bool isShortName = false}) {
    if (isShortName == true) {
      if (month == DateTime.january)
        return LocaleKeys.Date_jan.tr();
      else if (month == DateTime.february)
        return LocaleKeys.Date_feb.tr();
      else if (month == DateTime.march)
        return LocaleKeys.Date_mar.tr();
      else if (month == DateTime.april)
        return LocaleKeys.Date_apr.tr();
      else if (month == DateTime.may)
        return LocaleKeys.Date_mayShortly.tr();
      else if (month == DateTime.june)
        return LocaleKeys.Date_jun.tr();
      else if (month == DateTime.july)
        return LocaleKeys.Date_jly.tr();
      else if (month == DateTime.august)
        return LocaleKeys.Date_aug.tr();
      else if (month == DateTime.september)
        return LocaleKeys.Date_sep.tr();
      else if (month == DateTime.october)
        return LocaleKeys.Date_oct.tr();
      else if (month == DateTime.november)
        return LocaleKeys.Date_nov.tr();
      else if (month == DateTime.december)
        return LocaleKeys.Date_dec.tr();
      else
        return '';
    } else {
      if (month == DateTime.january)
        return LocaleKeys.Date_january.tr();
      else if (month == DateTime.february)
        return LocaleKeys.Date_february.tr();
      else if (month == DateTime.march)
        return LocaleKeys.Date_march.tr();
      else if (month == DateTime.april)
        return LocaleKeys.Date_april.tr();
      else if (month == DateTime.may)
        return LocaleKeys.Date_may.tr();
      else if (month == DateTime.june)
        return LocaleKeys.Date_june.tr();
      else if (month == DateTime.july)
        return LocaleKeys.Date_july.tr();
      else if (month == DateTime.august)
        return LocaleKeys.Date_august.tr();
      else if (month == DateTime.september)
        return LocaleKeys.Date_september.tr();
      else if (month == DateTime.october)
        return LocaleKeys.Date_october.tr();
      else if (month == DateTime.november)
        return LocaleKeys.Date_november.tr();
      else if (month == DateTime.december)
        return LocaleKeys.Date_december.tr();
      else
        return '';
    }
  }

  static DateTime firstDateOfWeek(DateTime? dateTime) {
    DateTime d = dateTime ?? DateTime.now();

    DateTime firstDayOfWeek = d.subtract(
      new Duration(
        days: d.weekday - 1,
      ),
    ); // - 1 Eklemez isek Pazar günü hafta başlangıcı olarak kabul ediliyor
    return firstDayOfWeek;
  }

  static DateTime lastDateOfWeek(DateTime? dateTime) {
    DateTime today = dateTime ?? DateTime.now();

    DateTime firstDayOfWeek =
        today.subtract(new Duration(days: today.weekday - 1));
// print('End of week: ${getDate(date.add(Duration(days: DateTime.daysPerWeek - date.weekday)))}');

    DateTime lastDayOfAWeek = firstDayOfWeek
        .add(Duration(days: DateTime.daysPerWeek - firstDayOfWeek.weekday));
    return lastDayOfAWeek;
  }

  static int firstDayOfMonth(DateTime? dateTime) {
    DateTime date = dateTime ?? DateTime.now();

    return DateTime(date.year, date.month - 1, 0).day;
  }

  static int lastDayOfMonth(DateTime? dateTime) {
    DateTime date = dateTime ?? DateTime.now();

    return DateTime(date.year, date.month + 1, 0).day;
  }

  static DateTime firstDateOfMonth(DateTime? dateTime) {
    DateTime date = dateTime ?? DateTime.now();

    return DateTime(date.year, date.month, 1);
  }

  static DateTime lastDateOfMonth(DateTime? dateTime) {
    DateTime date = dateTime ?? DateTime.now();

    return DateTime(date.year, date.month + 1, 0);
  }

  static DateTime getHourAndMinute({int? minute = 60}) {
    List<int> value = [];
    Duration duration = Duration(minutes: minute!);
    int minutes = duration.inMinutes.remainder(60);
    int hours = duration.inHours;
    value.add(hours);
    value.add(minutes);

    DateTime newDateTime =
        DateTime.now().copyWith(hour: hours, minute: minutes);

    return newDateTime;
  }

  static String hourAndMinuteLabelText(DateTime date) {
    if (date.hour != 0) {
      return '${date.hour}${LocaleKeys.Date_HourShortly.tr()} ${date.minute}${LocaleKeys.Date_MinuteShortly.tr()}';
    } else {
      return '${date.minute}${LocaleKeys.Date_MinuteShortly.tr()}';
    }
  }

  static getMinutesFromDateTime(DateTime dateTime) {
    return (dateTime.hour * 60) + dateTime.minute;
  }
}
