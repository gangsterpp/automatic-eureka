import 'package:flutter/material.dart';

enum _AppDragHandleType { light, dark }

/// Ручка перетаскивания (полосочка над ботом щитами)
class AppDragHandle extends StatelessWidget {
  const AppDragHandle.light({super.key}) : _type = _AppDragHandleType.light;

  const AppDragHandle.dark({super.key}) : _type = _AppDragHandleType.dark;

  final _AppDragHandleType _type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          color: switch (_type) {
            _AppDragHandleType.light => Colors.white.withAlpha(40),
            _AppDragHandleType.dark => Colors.black.withAlpha(20),
          },
        ),
      ),
    );
  }
}
