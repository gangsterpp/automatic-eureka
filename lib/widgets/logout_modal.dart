import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/gen/translations.g.dart' show t;
import 'package:vox_uikit/main.dart';

class LogoutModal extends StatelessWidget {
  final VoidCallback onLogout;
  const LogoutModal({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    t.logout_dialog_title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFF0B0C0E),
                    ),
                  ),
                ),
                Material(
                  color: const Color(0xFFF8F9F9),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 0.5,
                      color: Color(0xFFE2E4E9),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: context.pop,
                    child: Ink(
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              t.logout_confirm_text,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF0B0C0E),
              ),
            ),
          ),

          SafeArea(
            minimum: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
              bottom: 4,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 12,
              children: [
                Expanded(
                  child: AppAccentButton.primary(
                    onTapped: onLogout,
                    text: t.logout_confirm_button,
                  ),
                ),
                Expanded(
                  child: AppAccentButton.secondary(
                    onTapped: context.pop,
                    text: t.logout_cancel_button,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
