import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vox_uikit/appbar/custom_app_bar_widget.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: 'settings_screen',
      child: const Scaffold(appBar: CustomAppBar(title: Text('Настройки'))),
    );
  }
}
