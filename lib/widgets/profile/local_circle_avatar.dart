import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/gen/assets.gen.dart';

class LocalCircleAvatar extends StatelessWidget {
  final VoidCallback onAvatarTap;

  const LocalCircleAvatar({required this.onAvatarTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onAvatarTap,
              customBorder: const CircleBorder(),
              splashColor: const Color(0xFF914DFF),
              highlightColor: const Color(0xFF914DFF).withValues(alpha: 0.3),
              child: Ink(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE2E4E9),
                ),
                child: Center(
                  child: Assets.icons.photo.image(
                    width: 28,
                    height: 28,
                    package: 'vox_ui_kit',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -6,
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: onAvatarTap,
                borderRadius: BorderRadius.circular(8),
                child: Ink(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF914DFF),
                  ),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.add,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
