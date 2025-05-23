import 'package:flutter/material.dart';

const primaryColors = MaterialColor(0xFF000019, {
  900: Color(0xFF000019),
  600: Color(0XFF6925D7),
  500: Color(0XFF914DFF),
  400: Color(0XFFAA76FF),
  300: Color(0XFFCAA9FF),
  200: Color(0XFFE9DCFF),
  100: Color(0XFFF0E6FF),
});

const secondaryColors = MaterialColor(0xFFEA04C0, {
  600: Color(0xFFEA04C0),
  500: Color(0xFFFC5DE6),
  300: Color(0xFFFF99F1),
  100: Color(0xFFFFE5FC),
});

const grayColors = MaterialColor(0xFF0B0C0E, {
  950: Color(0xFF0B0C0E),
  900: Color(0xFF0B0C0E),
  700: Color(0xFF434956),
  600: Color(0xFF434956),
  400: Color(0xFF5A6172),
  300: Color(0xFF81899C),
  200: Color(0xFFA9AFBC),
  150: Color(0xFFE2E4E9),
  100: Color(0xFFF1F2F4),
  50: Color(0xFFF8F9F9),
  4: Color(0X660B0C0E),
});

const whiteColors = MaterialColor(0xFFFFFFFF, {900: Colors.white, 600: Color(0x33FFFFFF)});

const otherLightColors = MaterialColor(0xFFE5FFE9, {
  900: Color(0xFFE5FFE9),
  600: Color(0xFFD9EBFC),
  500: Color(0xFFFFF9E5),
  400: Color(0xFFFFECE1),
});
const otherRedColors = MaterialColor(0xFFF0214E, {500: Color(0xFFF0214E)});
const otherRedLightColors = MaterialColor(0xFFF5E3E5, {600: Color(0xFFF5E3E5), 500: Color(0xFFFFECEE), 400: Color(0xFFFFF2F4)});

extension MaterialColorExt on MaterialColor {
  LinearGradient get secondaryGradient =>
      LinearGradient(colors: [shade300, shade50], begin: Alignment.centerLeft, end: Alignment.centerRight);
}
