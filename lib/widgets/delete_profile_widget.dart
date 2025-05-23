import 'package:VOX/extensions/build_context_ext.dart';
import 'package:VOX/providers/profile_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';
import 'package:vox_ui_kit/theme/app_text.dart';

class DeleteProfileWidget extends ConsumerWidget {
  const DeleteProfileWidget({super.key});

  @override
  Widget build(context, ref) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    t.delete_profile_title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFF0B0C0E)),
                  ),
                ),
                Material(
                  color: const Color(0xFFF8F9F9),

                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0.5, color: Color(0xFFE2E4E9)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: context.pop,
                    child: Ink(child: const Padding(padding: EdgeInsets.all(4), child: Icon(Icons.close))),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFFE2E4E9)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppText(t.do_you_wanna_delete_profile_title, type: AppTextType.w400s14h20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: constraints.maxWidth / 31.25,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: context.buttonThemes.primaryElevatedButtonTheme?.style,
                        onPressed: ref.read(profileNotifierProvider.notifier).deleteProfile,
                        child: Text(t.confirm_button_title),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: context.buttonThemes.primaryElevatedButtonTheme?.style,
                        onPressed: context.pop,
                        child: Text(t.cancel_button_title),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
