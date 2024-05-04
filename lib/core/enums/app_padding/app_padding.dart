import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension MediaQueryExtension on BuildContext {
  double get lowValue => 8;

  double get defaultValue => 12;

  double get highValue => 14;

  double get veryhighValue1x => 16;

  double get veryhighValue2x => 20;

  double get veryhighValue3x => 24;

  double dynamicWidth(double val) => val.sw;
  double dynamicHeight(double val) => val.sh;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllLow => EdgeInsets.all(lowValue);

  EdgeInsets get paddingAllDefault => EdgeInsets.all(defaultValue);

  EdgeInsets get paddingAllHigh => EdgeInsets.all(veryhighValue1x);

  EdgeInsets get paddingAllHigh2 => EdgeInsets.all(veryhighValue2x);

  EdgeInsets get paddingAllHigh3 => EdgeInsets.all(veryhighValue3x);

  EdgeInsets get paddingHorizontalLow =>
      EdgeInsets.symmetric(horizontal: lowValue);

  EdgeInsets get paddingHorizontalDefault =>
      EdgeInsets.symmetric(horizontal: defaultValue);

  EdgeInsets get paddingHorizontalHigh =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get paddingHorizontalHigh2 =>
      EdgeInsets.symmetric(horizontal: veryhighValue2x);

  EdgeInsets get paddingHorizontalHigh3 =>
      EdgeInsets.symmetric(horizontal: veryhighValue3x);

  EdgeInsets get paddingVerticalLow => EdgeInsets.symmetric(vertical: lowValue);

  EdgeInsets get paddingVerticalDefault =>
      EdgeInsets.symmetric(vertical: defaultValue);

  EdgeInsets get paddingVerticalHigh =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingVerticalHigh2 =>
      EdgeInsets.symmetric(vertical: veryhighValue2x);

  EdgeInsets get paddingVerticalHigh3 =>
      EdgeInsets.symmetric(vertical: veryhighValue3x);

  EdgeInsets get paddingRightLow => EdgeInsets.only(right: lowValue);

  EdgeInsets get paddingRightDefault => EdgeInsets.only(right: defaultValue);

  EdgeInsets get paddingRightHigh => EdgeInsets.only(right: highValue);

  EdgeInsets get paddingLeftLow => EdgeInsets.only(left: lowValue);

  EdgeInsets get paddingLeftDefault => EdgeInsets.only(left: defaultValue);

  EdgeInsets get paddingLeftHigh => EdgeInsets.only(left: highValue);

  EdgeInsets get paddingTopLow => EdgeInsets.only(top: lowValue);

  EdgeInsets get paddingTopDefault => EdgeInsets.only(top: defaultValue);

  EdgeInsets get paddingTopHigh => EdgeInsets.only(top: highValue);

  EdgeInsets get paddingBottomLow => EdgeInsets.only(bottom: lowValue);

  EdgeInsets get paddingBottomDefault => EdgeInsets.only(bottom: defaultValue);

  EdgeInsets get paddingBottomHigh => EdgeInsets.only(bottom: highValue);
}
