import 'package:VOX/features/home/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_ui_kit/vox_ui_kit.dart';

class NotificationIcon extends ConsumerWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNotificationActive = ref.watch(notificationServiceProvider);
    return SizedBox(
      height: 36,
      child: Material(
        clipBehavior: Clip.hardEdge,
        type: MaterialType.card,
        color: Colors.white,
        elevation: 1,
        shadowColor: Colors.white.withValues(alpha: 0.4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: InkWell(
          onTap:
              isNotificationActive
                  ? (ref
                      .read(notificationServiceProvider.notifier)
                      .noActiveOrder)
                  : (ref
                      .read(notificationServiceProvider.notifier)
                      .hasActiveOrder),
          child: Padding(
            padding: const EdgeInsetsGeometry.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children: [
                Assets.icons.notificationIcon.image(
                  height: 24,
                  width: 24,
                  color: secondaryColors.shade500,
                  package: 'vox_ui_kit',
                ),
                if (isNotificationActive) const SizedBox(width: 8),
                AnimatedCrossFade(
                  firstChild: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppText('У вас есть', type: AppTextType.w500s14),
                      AppText(
                        ' активный заказ',
                        type: AppTextType.w500s14,
                        color: secondaryColors.shade600,
                      ),
                    ],
                  ),
                  secondChild: const SizedBox.shrink(),
                  firstCurve: Curves.easeIn,
                  secondCurve: Curves.easeOut,
                  sizeCurve: Curves.easeIn,
                  alignment:
                      isNotificationActive
                          ? Alignment.center
                          : Alignment.centerRight,
                  crossFadeState:
                      isNotificationActive
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 250),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
