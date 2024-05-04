import 'dart:math';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:reprocare/common/logger/app_logger.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AppFunctions {
  // static Future<FormData> convertToFormData({required XFile file}) async {
  //   FormData formData = FormData.fromMap({
  //     "file": MultipartFile.fromFileSync(
  //       file.path,
  //       filename: file.name,
  //     ),
  //   });

  //   return formData;
  // }

  static String getFirstLetterNameAndSurname(String? fullName) {
    if (fullName == null || fullName.trim() == '') return '';
    try {
      if (fullName[0] == ' ') {
        fullName = fullName.replaceRange(0, 0, '');
      }
      if (fullName[fullName.length - 1] == ' ') {
        fullName =
            fullName.replaceRange(fullName.length - 1, fullName.length, '');
      }

      String? formattedName =
          '${fullName.split(' ').first.characters.first.toUpperCase()}${fullName.split(' ').last.characters.first.toUpperCase()}';

      return formattedName;
    } on Exception {
      return '';
    }
  }

  static Color hexStringToColor({String? hexString}) {
    if (hexString == null || hexString.length == 0) return Colors.white;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String colorToHexString({required Color color}) {
    String hexColor = '#'
        '${color.red.toRadixString(16).padLeft(2, '0')}'
        '${color.green.toRadixString(16).padLeft(2, '0')}'
        '${color.blue.toRadixString(16).padLeft(2, '0')}';

    AppLogger.call(title: 'Color to Hex Color', value: hexColor);

    return hexColor;
  }

  static Future openStringUrl({required String url}) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.inAppWebView);
    } else {
      AppLogger.call(
        logLevel: Level.error,
        title: 'Open String URL',
        value: 'Could not launch $url',
      );
    }
  }

  static String randomGuid() {
    Uuid uuid = Uuid();

    return uuid.v1();
  }

  static int randomNumberWithRange({required int min, required int max}) {
    Random rnd = new Random();

    int randomValue = min + rnd.nextInt((max + 1) - min);
    return randomValue;
  }
}
