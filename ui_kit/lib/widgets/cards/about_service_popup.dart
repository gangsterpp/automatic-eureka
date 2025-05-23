import 'package:flutter/material.dart';

import '../../gen/translations.g.dart';
import '../../theme/app_text.dart';
import '../../theme/colors.dart';

class AboutServicePopup extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onClose;
  const AboutServicePopup({super.key, required this.title, required this.description, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppText(title, type: AppTextType.w400s12h1P2, color: grayColors.shade600),
                  TextButton(
                    onPressed: onClose,
                    child: AppText(t.hide_all_button_title, type: AppTextType.w600s12h20, color: primaryColors.shade500),
                  ),
                ],
              ),
            ),
            Flexible(
              child: AppText(
                description,
                type: AppTextType.w400s12h1P2,
                color: grayColors.shade600,
                overflow: TextOverflow.fade,
                maxLines: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
