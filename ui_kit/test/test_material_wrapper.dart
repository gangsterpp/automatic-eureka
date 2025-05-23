import 'package:flutter/material.dart';
import 'package:vox_ui_kit/theme/app_theme.dart';

Widget testMaterialWrapper(Widget child) => MaterialApp(theme: AppTheme.light, home: child, debugShowCheckedModeBanner: false);
