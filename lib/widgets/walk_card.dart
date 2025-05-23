import 'package:flutter/material.dart';
import 'package:vox_uikit/theme/app_colors.dart';

typedef WalkController = ValueNotifier<int>;

class WalkCard extends StatelessWidget {
  final WidgetBuilder price;
  final int index;
  final WidgetBuilder description;
  final WalkController controller;
  const WalkCard({
    super.key,
    required this.price,
    required this.description,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = controller.value == index;
    return Semantics(
      identifier: 'Карточка с описанием и ценой',
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,

        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => controller.value = index,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    isSelected
                        ? AppColors.secondary300
                        : const Color(0xFFF1F2F4),
                width: 1,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  if (isSelected) ...[
                    AppColors.secondary100.withOpacity(0.04),
                    AppColors.secondary100,
                  ] else ...[
                    const Color(0xFFF1F2F4).withOpacity(0.04),
                    const Color(0xFFF1F2F4),
                  ],
                ],
              ),
              boxShadow: [
                if (isSelected) ...[
                  BoxShadow(
                    color: Colors.white.withOpacity(0.04),
                    blurRadius: 6,
                    spreadRadius: -4,
                    blurStyle: BlurStyle.inner,
                  ),
                  BoxShadow(
                    color: const Color(0xFF00C233).withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),
                    blurStyle: BlurStyle.outer,
                  ),
                ] else ...[
                  const BoxShadow(
                    color: Color(0xFFF1F2F4),
                    blurRadius: 10,
                    spreadRadius: -4,
                  ),
                ],
              ],
            ),
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 6,
                children: [
                  price(context),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      Image.asset(
                        'assets/calendar.png',
                        width: 14,
                        height: 14,
                        color: AppColors.gray200,
                      ),
                      description(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
