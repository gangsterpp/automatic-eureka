import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vox_uikit/main.dart';

enum _AppBottomSheetDecorationType { scrollable, fixed }

class AppBottomSheetDecoration extends StatefulWidget {
  /// Использовать если колонка контента может не поместиться по высоте экрана (только для небольших списков)
  const AppBottomSheetDecoration.scrollable({
    required this.title,
    required this.child,
    this.showDragHandle = true,
    this.subtitle,
    this.leading,
    super.key,
  }) : _type = _AppBottomSheetDecorationType.scrollable;

  /// Использовать если колонка контента будет гарантированно меньше высоты экрана
  const AppBottomSheetDecoration.fixed({
    required this.title,
    required this.child,
    this.showDragHandle = true,
    this.subtitle,
    this.leading,
    super.key,
  }) : _type = _AppBottomSheetDecorationType.fixed;

  final String title;
  final Widget child;
  final bool showDragHandle;
  final String? subtitle;
  final Widget? leading;

  final _AppBottomSheetDecorationType _type;

  @override
  State<AppBottomSheetDecoration> createState() =>
      _AppBottomSheetDecorationState();
}

class _AppBottomSheetDecorationState extends State<AppBottomSheetDecoration> {
  static const double _initSize = 0.7;
  static const double _maxSize = 0.9;
  late double _initSizeFraction;
  late double _maxSizeFraction;

  @override
  void initState() {
    _initSizeFraction = _initSize;
    _maxSizeFraction = _maxSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget._type) {
      _AppBottomSheetDecorationType.fixed => _DecoratedHeader(
          title: widget.title,
          showDragHandle: widget.showDragHandle,
          subtitle: widget.subtitle,
          leading: widget.leading,
          child: widget.child,
        ),
      _AppBottomSheetDecorationType.scrollable => DraggableScrollableSheet(
          expand: false,
          initialChildSize: _initSizeFraction,
          minChildSize: _initSizeFraction * 0.5,
          maxChildSize: _maxSizeFraction,
          builder: (context, scrollController) => _DecoratedHeader(
            title: widget.title,
            showDragHandle: widget.showDragHandle,
            subtitle: widget.subtitle,
            leading: widget.leading,
            child: Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: _MeasureSize(
                  onChange: (s) {
                    setState(() {
                      final measuredFraction =
                          (s.height + (widget.subtitle == null ? 56 : 60)) /
                              MediaQuery.sizeOf(context).height;
                      _maxSizeFraction = min(_maxSize, measuredFraction);
                      _initSizeFraction =
                          min(_maxSizeFraction, measuredFraction);
                    });
                  },
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
    };
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _DecoratedHeader extends StatelessWidget {
  const _DecoratedHeader({
    required this.title,
    required this.child,
    required this.showDragHandle,
    this.subtitle,
    this.leading,
  });

  final String title;
  final Widget child;
  final bool showDragHandle;
  final String? subtitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// ручка перетаскивания
        if (showDragHandle)
          const SizedBox(
            height: 0,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -10,
                  child: AppDragHandle.light(),
                ),
              ],
            ),
          ),

        /// Шапка
        DecoratedBox(
          decoration: const BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(
                color: AppColors.gray100,
                width: 1,
              ),
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: subtitle == null ? 56 : 60),
            child: Row(
              children: [
                SizedBox(
                  width: 56,
                  child: leading == null ? null : Center(child: leading),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.s18h24w500$H3.copyWith(
                            color: AppColors.gray900,
                          ),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle ?? '',
                            style: AppTextStyles.s14h20w500$Caption.copyWith(
                              color: AppColors.gray400,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 56,
                  child: Center(
                    child: AppIconButtonMini.closeTertiary(
                      onTapped: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// Контент
        child,
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _MeasureSize extends SingleChildRenderObjectWidget {
  const _MeasureSize({
    required this.onChange,
    required Widget super.child,
  });

  final void Function(Size size) onChange;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MeasureSizeRenderObject(onChange);
  }
}

class _MeasureSizeRenderObject extends RenderProxyBox {
  _MeasureSizeRenderObject(this.onChange);

  final void Function(Size size) onChange;
  Size? oldSize;

  @override
  void performLayout() {
    super.performLayout();

    final newSize = child!.size;
    if (oldSize == newSize) {
      return;
    }

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}
