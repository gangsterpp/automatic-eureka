import 'package:VOX/core/utils/size_utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';

@RoutePage()
class PolicyScreen extends ConsumerStatefulWidget {
  const PolicyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends ConsumerState<PolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          width: 44.h,
          height: 44.v,
          padding: const EdgeInsets.all(8.0), // Отступ для тени
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetImage('assets/images/arrow_left_button.png'), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Яркая тень
                offset: const Offset(0, 4), // Смещение тени вниз
                blurRadius: 8.0, // Меньший радиус размытия
                spreadRadius: 4.0, // Меньше распространение
              ),
            ],
          ),
        ),
        title: Text(t.privacy_policy_title),
      ),
      body: const SafeArea(child: Center(child: Column())),
    );
  }
}
