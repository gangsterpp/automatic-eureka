import 'package:flutter/material.dart';

import '../../vox_ui_kit.dart';

sealed class WalkPlanCardDescription {
  Widget build(BuildContext context, Color? color);
  const WalkPlanCardDescription();
}

class WalkPlanCardRegular extends WalkPlanCardDescription {
  final String description;
  const WalkPlanCardRegular({required this.description});

  @override
  Widget build(BuildContext context, Color? color) => Row(
    spacing: 4,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(child: Image.asset('assets/calendar.png', width: 14, height: 14, color: color)),
      Flexible(child: AppText(description, type: AppTextType.w400s14h20)),
    ],
  );
}

class WalkPlanCardSubscriptionTen extends WalkPlanCardDescription {
  final String description;
  const WalkPlanCardSubscriptionTen({required this.description});

  @override
  Widget build(BuildContext context, Color? color) => Container(
    width: double.infinity,
    decoration: BoxDecoration(color: const Color(0xFFF2E5FF), borderRadius: BorderRadius.circular(6)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(child: AppText(description, type: AppTextType.w400s14h20, maxLines: 1, overflow: TextOverflow.ellipsis)),
          const SizedBox(width: 4),
          Icon(Icons.panorama_wide_angle, size: 14, color: primaryColors.shade400),
        ],
      ),
    ),
  );
}

class WalkPlanCardSubscriptionTwenty extends WalkPlanCardDescription {
  final String description;
  const WalkPlanCardSubscriptionTwenty({required this.description});

  @override
  Widget build(BuildContext context, Color? color) => Container(
    width: double.infinity,
    decoration: BoxDecoration(color: const Color(0xFFFFECE1), borderRadius: BorderRadius.circular(6)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(child: AppText(description, type: AppTextType.w400s14h20, maxLines: 1, overflow: TextOverflow.ellipsis)),
          Icon(Icons.panorama_wide_angle, size: 14, color: primaryColors.shade400),
        ],
      ),
    ),
  );
}

class WalkPlanCard extends StatefulWidget {
  final String price;
  final WalkPlanCardDescription description;
  final VoidCallback? onTap;
  final bool isSelected;

  const WalkPlanCard({super.key, required this.price, required this.description, this.onTap, this.isSelected = false});

  @override
  State<WalkPlanCard> createState() => _WalkPlanCardState();
}

class _WalkPlanCardState extends State<WalkPlanCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<Color?> _colorAnimation;
  late final Animation<Color?> _borderColorAnimation;
  late final Animation<Color?> _iconColorAnimation;

  bool _isPressed = false;

  final _tooltipController = OverlayPortalController();
  final _link = LayerLink();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _colorAnimation = ColorTween(
      begin: const Color(0xFFF8F9F9),
      end: const Color(0xFFFFE5FC),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _borderColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: const Color(0xFFFF99F1),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _iconColorAnimation = ColorTween(
      begin: const Color(0xFFA9AFBC),
      end: const Color(0xFFFF99F1),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(WalkPlanCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.isSelected) {
          _tooltipController.show();
        } else {
          _tooltipController.hide();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.isSelected) {
      setState(() => _isPressed = true);
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (_isPressed) {
      setState(() => _isPressed = false);
      _controller.reverse();
      widget.onTap?.call();
    }
  }

  void _handleTapCancel() {
    if (_isPressed) {
      setState(() => _isPressed = false);
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isActive = widget.isSelected || _isPressed;
    final backgroundColor = isActive ? const Color(0xFFFFE5FC) : _colorAnimation.value;
    final borderColor = isActive ? const Color(0xFFFF99F1) : _borderColorAnimation.value!;
    final iconColor = isActive ? const Color(0xFFFF99F1) : _iconColorAnimation.value;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 156, maxWidth: 171),
            child: CompositedTransformTarget(
              link: _link,
              child: OverlayPortal(
                overlayChildBuilder: (context) {
                  return CompositedTransformFollower(
                    link: _link,
                    targetAnchor: const Alignment(0.9, -0.9),
                    followerAnchor: Alignment.center,
                    child: const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [Color(0xFFFF99F1), Color(0xFFFC5DE6)]),
                          ),
                          child: Icon(Icons.check, size: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
                controller: _tooltipController,
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  clipBehavior: Clip.hardEdge,
                  child: GestureDetector(
                    onTapDown: _handleTapDown,
                    onTapUp: _handleTapUp,
                    onTapCancel: _handleTapCancel,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor, width: 1),
                        boxShadow: [
                          if (isActive) ...[
                            BoxShadow(color: const Color(0xFFFF00C2).withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2)),
                            const BoxShadow(color: Color(0x0A000000), blurRadius: 10, offset: Offset(0, -4)),
                            const BoxShadow(color: Color(0x66FFFFFF), blurRadius: 6, offset: Offset(0, 4)),
                          ] else ...[
                            const BoxShadow(color: Color(0x0A000000), blurRadius: 10, offset: Offset(0, -4)),
                            const BoxShadow(color: Color(0x66FFFFFF), blurRadius: 6, offset: Offset(0, 4)),
                          ],
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.price,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 1.2,
                                color: Color(0xFF0B0C0E),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Flexible(child: widget.description.build(context, iconColor)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
