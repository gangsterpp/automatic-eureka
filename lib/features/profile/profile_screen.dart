import 'package:VOX/features/profile/profile_body.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/vox_ui_kit.dart';
import 'package:vox_ui_kit/widgets/app_scaffold.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AppScaffold(
        builder: (_) => const ProfileBody(),
        title: AppText(t.profile_title, type: AppTextType.w60016s22H),
        leading: IconButton(onPressed: context.pop, icon: const Icon(CupertinoIcons.chevron_back), color: grayColors),
      ),
    );
  }
}
