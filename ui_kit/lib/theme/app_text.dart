import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../vox_ui_kit.dart';

enum AppTextType {
  w400s12h14,
  w400s12h1P2,
  w400s12h16,
  w400s14h20,
  w50016s1P2,
  w500s14,
  w500s14h20,

  w60016s22H,
  w600s12h20,
  w600s14h20,
  w600s16h24,
  w600s18,
  w70020s28H,
}

abstract class CustomSpan {
  const CustomSpan();
  InlineSpan toTextSpan(TextStyle baseStyle);
}

class TextCustomSpan extends CustomSpan {
  final String text;
  final AppTextType type;
  final Color? color;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  const TextCustomSpan({required this.text, required this.type, this.color, this.fontSize, this.height, this.fontWeight, this.decoration});

  @override
  InlineSpan toTextSpan(TextStyle baseStyle) {
    return TextSpan(
      text: text,
      style: baseStyle.copyWith(color: color, fontSize: fontSize, height: height, fontWeight: fontWeight, decoration: decoration),
    );
  }
}

class TapCustomSpan extends CustomSpan {
  final String text;
  final AppTextType type;
  final VoidCallback onTap;
  final Color? color;

  const TapCustomSpan({required this.text, required this.type, required this.onTap, this.color});

  @override
  InlineSpan toTextSpan(TextStyle baseStyle) {
    return TextSpan(text: text, style: baseStyle.copyWith(color: color), recognizer: TapGestureRecognizer()..onTap = onTap);
  }
}

/// Универсальный виджет для отображения текста с поддержкой типовых стилей и rich text.
///
/// Позволяет использовать как обычный текст с предустановленными стилями ([AppTextType]),
/// так и сложный rich text с индивидуальными стилями и обработчиками нажатий для отдельных частей текста.
///
/// Пример обычного использования:
/// ```dart
/// AppText(
///   'Привет, мир!',
///   type: AppTextType.w400s14h20,
/// )
/// ```
///
/// Пример использования с rich text:
/// ```dart
/// AppText(
///   'Привет, ',
///   type: AppTextType.w400s14h20,
///   customSpans: [
///     TextCustomSpan(
///       text: 'мир',
///       type: AppTextType.w70020s28H,
///       color: Colors.red,
///       decoration: TextDecoration.underline,
///     ),
///     TapCustomSpan(
///       text: ' (нажми меня)',
///       type: AppTextType.w400s12h14,
///       onTap: () => print('Tapped!'),
///       color: Colors.blue,
///     ),
///   ],
/// )
/// ```
///
/// Можно комбинировать любые стили и добавлять обработчики нажатий для отдельных частей текста.
///
/// - [value] — основной текст.
/// - [type] — типовой стиль для основного текста.
/// - [customSpans] — список кастомных спанов для rich text.
/// - [color], [fontSize], [height], [textAlign], [letterSpacing], [maxLines], [overflow] — стандартные параметры для настройки текста.
///
/// Для создания кастомных спанов используйте [TextCustomSpan] и [TapCustomSpan].
///
/// {@tool snippet}
/// Пример с кастомным спаном и обработчиком нажатия:
/// ```dart
/// AppText(
///   'Текст ',
///   type: AppTextType.w400s14h20,
///   customSpans: [
///     TextCustomSpan(
///       text: 'жирный',
///       type: AppTextType.w70020s28H,
///       color: Colors.green,
///     ),
///     TapCustomSpan(
///       text: ' (нажми)',
///       type: AppTextType.w400s12h14,
///       onTap: () => print('Tap!'),
///       color: Colors.blue,
///     ),
///   ],
/// )
/// ```
/// {@end-tool}
class AppText extends StatelessWidget {
  final String value;
  final AppTextType type;
  final Color? color;
  final double? fontSize;
  final double? height;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? overflow;
  final List<CustomSpan> customSpans;

  const AppText(
    this.value, {
    super.key,
    required this.type,
    this.color,
    this.fontSize,
    this.height,
    this.textAlign,
    this.letterSpacing,
    this.maxLines,
    this.overflow,
    this.customSpans = const [],
  });

  factory AppText.rich(
    String value, {
    required List<CustomSpan> customSpans,
    required AppTextType type,
    Color? color,
    double? fontSize,
    double? height,
    TextAlign? textAlign,
    double? letterSpacing,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    value,
    type: type,
    color: color,
    fontSize: fontSize,
    height: height,
    textAlign: textAlign,
    letterSpacing: letterSpacing,
    maxLines: maxLines,
    overflow: overflow,
    customSpans: customSpans,
  );

  TextStyle _getBaseStyle({AppTextType? type}) {
    return switch (type ?? this.type) {
      AppTextType.w400s14h20 => TextStyle(fontWeight: FontWeight.w400, fontSize: 14, height: 20 / 14, color: grayColors),
      AppTextType.w600s16h24 => TextStyle(fontWeight: FontWeight.w600, fontSize: 16, height: 24 / 16, color: grayColors),
      AppTextType.w400s12h1P2 => TextStyle(fontWeight: FontWeight.w400, fontSize: 12, height: 1.2, color: grayColors),
      AppTextType.w600s12h20 => TextStyle(fontWeight: FontWeight.w600, fontSize: 12, height: 20 / 12, color: grayColors),
      AppTextType.w400s12h14 => TextStyle(fontWeight: FontWeight.w400, fontSize: 12, height: 2, color: grayColors),
      AppTextType.w600s18 => TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: grayColors),
      AppTextType.w500s14 => TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: grayColors),
      AppTextType.w60016s22H => TextStyle(fontWeight: FontWeight.w600, fontSize: 16, height: 22 / 16, color: grayColors),
      AppTextType.w70020s28H => TextStyle(fontWeight: FontWeight.w700, fontSize: 20, height: 28 / 20, color: grayColors),
      AppTextType.w600s14h20 => TextStyle(fontWeight: FontWeight.w600, fontSize: 14, height: 20 / 14, color: grayColors),
      AppTextType.w50016s1P2 => TextStyle(fontWeight: FontWeight.w500, fontSize: 16, height: 1.2, color: grayColors),
      AppTextType.w500s14h20 => TextStyle(fontWeight: FontWeight.w500, fontSize: 14, height: 20 / 14, color: grayColors),
      AppTextType.w400s12h16 => TextStyle(fontWeight: FontWeight.w400, fontSize: 12, height: 16 / 12, color: grayColors),
    };
  }

  @override
  Widget build(BuildContext context) {
    final base = _getBaseStyle();
    if (customSpans.isNotEmpty) {
      return RichText(
        text: TextSpan(
          text: value,
          style: base.copyWith(
            color: color ?? base.color,
            fontSize: fontSize ?? base.fontSize,
            height: height ?? base.height,
            letterSpacing: letterSpacing ?? base.letterSpacing,
            overflow: overflow ?? base.overflow,
          ),
          children: [for (final span in customSpans) span.toTextSpan(_getBaseStyle(type: span is TextCustomSpan ? (span).type : type))],
        ),
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.clip,
      );
    }
    return Text(
      value,
      style: base.copyWith(
        color: color ?? base.color,
        fontSize: fontSize ?? base.fontSize,
        height: height ?? base.height,
        letterSpacing: letterSpacing ?? base.letterSpacing,
        overflow: overflow ?? base.overflow,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
