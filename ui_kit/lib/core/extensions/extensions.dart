import 'package:flutter/material.dart';

extension ColorExt on Color {
  WidgetStateProperty<Color> get property => WidgetStatePropertyAll(this);
}

extension OutlinedBorderExt on OutlinedBorder {
  WidgetStateProperty<OutlinedBorder> get property => WidgetStatePropertyAll(this);
}
