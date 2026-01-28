import 'package:flutter/material.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/text_styles/app_text_styles.dart';
import 'package:reprocare/core/constants/text_types/app_text_types.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.fontWeight = AppFontWeight.medium,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing = 0.15,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.bodyMedium,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.displayLarge(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.displayLarge,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.displayMedium(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.displayMedium,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.displaySmall(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.displaySmall,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.headlineLarge(
    this.text, {
    super.key,
    this.style,
    this.fontWeight = AppFontWeight.medium,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.headlineLarge,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.headlineMedium(
    this.text, {
    super.key,
    this.style,
    this.fontWeight = AppFontWeight.medium,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.headlineMedium,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.headlineSmall(
    this.text, {
    super.key,
    this.style,
    this.fontWeight = AppFontWeight.medium,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.headlineSmall,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.titleLarge(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.titleLarge,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.titleMedium(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.titleMedium,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.titleSmall(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.titleSmall,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.labelLarge(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.labelLarge,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.labelMedium(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.labelMedium,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.labelSmall(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.labelSmall,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.bodyLarge(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.bodyLarge,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.bodyMedium(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.bodyMedium,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  const AppText.bodySmall(
    this.text, {
    super.key,
    this.style,
    this.fontWeight,
    this.muted = false,
    this.xMuted = false,
    this.letterSpacing,
    this.color,
    this.decoration = TextDecoration.none,
    this.height,
    this.wordSpacing = 0,
    this.fontSize,
    this.textType = AppTextType.bodySmall,
    this.textAlign,
    this.maxLines,
    this.locale,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  });

  final String text;
  final TextStyle? style;
  final AppFontWeight? fontWeight;
  final bool muted;
  final bool xMuted;
  final double? letterSpacing;
  final Color? color;
  final TextDecoration decoration;
  final double? height;
  final double wordSpacing;
  final double? fontSize;
  final AppTextType textType;

  //Text Style
  final TextAlign? textAlign;
  final int? maxLines;
  final Locale? locale;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          AppTextStyle.getStyle(
            textStyle: style,
            color: color,
            fontWeight: fontWeight ?? AppFontWeight.medium,
            muted: muted,
            letterSpacing: letterSpacing ?? 0.15,
            height: height,
            xMuted: xMuted,
            decoration: decoration,
            wordSpacing: wordSpacing,
            fontSize: fontSize ?? textType.fontSize,
          ),
      textAlign: textAlign,
      maxLines: maxLines,
      locale: locale,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textWidthBasis: textWidthBasis,
      key: key,
    );
  }
}
