import 'package:flutter/material.dart';
import 'package:vox_ui_kit/theme/app_button_theme.dart';

extension BuildContextExt on BuildContext {
  AppButtonTheme get buttonThemes => Theme.of(this).extension<AppButtonTheme>()!;
}
