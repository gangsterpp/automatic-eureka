import 'package:VOX/extensions/build_context_ext.dart';
import 'package:VOX/widgets/delete_profile_widget.dart';
import 'package:VOX/widgets/logout_modal.dart';
import 'package:VOX/widgets/modal_contries.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/vox_ui_kit.dart';

abstract class AdaptiveDialog {
  static Future<void> showDialod(BuildContext context) async {
    final buttonThemes = Theme.of(context).extension<AppButtonTheme>()!;
    showAdaptiveDialog(
      context: context,
      builder:
          (context) => Align(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [IconButton(onPressed: context.pop, icon: const Icon(Icons.close, color: Color(0xFF0B0C0E)))],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 8),
                      child: Text(
                        t.not_found_service_title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF0B0C0E)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
                      child: Text(
                        t.not_found_service_full_text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xff434956)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
                      child: ElevatedButton(
                        style: context.buttonThemes.primaryElevatedButtonTheme?.style,
                        onPressed: () {},
                        child: Text(t.chat_button_title),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  static Future<void> showModalBottomSheetLogOut(BuildContext context, VoidCallback onLogout) async {
    return showModalBottomSheet(context: context, builder: (context) => LogoutModal(onLogout: onLogout));
  }

  static Future<void> showModalCountries(BuildContext context) async {
    return showModalBottomSheet(
      useSafeArea: true,
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height / 1.5),
      builder: (context) => const RepaintBoundary(child: ModalContries()),
    );
  }

  static Future<void> showModalDeleteProfile(BuildContext context) async {
    return showModalBottomSheet(
      useSafeArea: true,
      enableDrag: true,
      context: context,
      builder: (context) => const RepaintBoundary(child: DeleteProfileWidget()),
    );
  }
}
