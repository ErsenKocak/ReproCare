import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';

class AppTextButton extends StatelessWidget {
  final String? text;
  final String? buttonText;
  TextStyle? textTextStyle;
  TextStyle? buttonTextStyle;
  final Function() onTap;
  final bool? isFirstButtonText;

  AppTextButton({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onTap,
    this.buttonTextStyle,
    this.textTextStyle,
    this.isFirstButtonText,
  });

  @override
  Widget build(final BuildContext context) {
    buttonTextStyle ??= AppThemes.currentTheme.textTheme.bodySmall!
        .copyWith(color: AppLightColors.primaryColor);
    textTextStyle ??= AppThemes.currentTheme.textTheme.bodySmall!;
    return RichText(
      text: _buildTextSpan,
    );
  }

  TextSpan get _buildTextSpan {
    if (isFirstButtonText == false) {
      return TextSpan(
        children: [
          TextSpan(
            text: text,
            style: textTextStyle,
          ),
          TextSpan(
            text: buttonText,
            style: buttonTextStyle,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      );
    } else {
      return TextSpan(
        children: [
          TextSpan(
            text: buttonText,
            style: buttonTextStyle,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
          TextSpan(
            text: text,
            style: textTextStyle,
          ),
        ],
      );
    }
  }
}
