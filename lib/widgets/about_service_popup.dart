import 'package:flutter/material.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';
import 'package:vox_uikit/main.dart';

class AboutServicePopup extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onClose;
  const AboutServicePopup({
    super.key,
    required this.title,
    required this.description,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(12),
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
                  Text(
                    title,
                    style: AppTextStyles.s16h20w500$BodyM.copyWith(
                      color: AppColors.grayScale950,
                    ),
                  ),
                  TextButton(
                    onPressed: onClose,
                    child: Text(
                      t.hide_all_button_title,
                      style: AppTextStyles.s12h20w600$ButtonS.copyWith(
                        color: AppColors.primary500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Text(
                description,
                style: AppTextStyles.s12h16w400$Label.copyWith(
                  color: AppColors.gray600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
