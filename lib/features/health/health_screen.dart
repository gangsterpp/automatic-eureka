import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/vox_ui_kit.dart';
import 'package:vox_ui_kit/widgets/app_scaffold.dart';

@RoutePage()
class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppText(t.health_title, type: AppTextType.w60016s22H),
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              t.health_description_title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xff81899C)),
            ),
          ),
        );
      },
    );
  }
}
