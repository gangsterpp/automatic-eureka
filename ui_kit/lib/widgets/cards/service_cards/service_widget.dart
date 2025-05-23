import 'package:flutter/material.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as fiw;

import '../../../gen/assets.gen.dart';

abstract class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key, this.onTap});
  const factory ServiceWidget.dogWalk({Key? key, VoidCallback? onTap}) = ServiceDogWalk;

  final VoidCallback? onTap;

  Color get backgroundColor;

  Widget builder(BuildContext context, BoxConstraints constraints);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: fiw.BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          fiw.BoxShadow(offset: const Offset(-20, -20), blurRadius: 60, color: Colors.white.withOpacity(0.6), inset: true),
          fiw.BoxShadow(offset: const Offset(0, 8), blurRadius: 5, color: Colors.white.withOpacity(0.6), inset: true),
        ],
      ),

      child: Material(
        elevation: 2,
        shadowColor: Colors.white.withAlpha((255 * 0.6).toInt()),
        surfaceTintColor: backgroundColor,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.hardEdge,
        type: MaterialType.card,
        child: InkWell(
          onTap: onTap,
          splashColor: backgroundColor,
          focusColor: backgroundColor,
          hoverColor: backgroundColor,
          child: LayoutBuilder(builder: builder),
        ),
      ),
    );
  }
}

class ServiceDogWalk extends ServiceWidget {
  @override
  Color get backgroundColor => const Color(0xFFF0E6FF);

  const ServiceDogWalk({super.key, super.onTap});

  @override
  Widget builder(context, _) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final orientation = mediaQuery.orientation;
    double width, height, leftPadding, leftMicroPadding, bottomPadding, bottomMicroPadding;

    if (orientation == Orientation.portrait) {
      width = size.width / 1.75;
      height = size.height / 6.06;
      leftPadding = width / 28.58;
      leftMicroPadding = width / 42.875;
      bottomPadding = height / 8.14;
      bottomMicroPadding = height / 28.5;
    } else {
      // Эти значения выдумка
      width = size.width / 2.2;
      height = size.height / 1.8;
      leftPadding = width / 20;
      leftMicroPadding = width / 30;
      bottomPadding = height / 5;
      bottomMicroPadding = height / 10;
    }

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: leftPadding, top: leftPadding, bottom: bottomPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              spacing: height / 3.67,
              children: const [
                Text.rich(
                  TextSpan(
                    text: 'Выгул\n',
                    children: [
                      TextSpan(
                        text: 'от 600 ',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, height: 16 / 12, color: Color(0xFF0B0C0E)),
                        children: [
                          TextSpan(
                            text: '₽',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              height: 16 / 12,
                              color: Color(0xFF0B0C0E),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF0B0C0E), fontSize: 16),

                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
            left: leftPadding,
            height: height / 5.18,
            bottom: bottomPadding,
            child: DecoratedBox(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: leftMicroPadding, vertical: bottomMicroPadding),
                child: SizedBox(
                  height: height,
                  child: const Text(
                    'Ожидание от 60 минут',

                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.w400, color: Color(0xFF0B0C0E), fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: width / 5.53,
            width: width / 2,
            height: height,
            bottom: 0,
            child: Assets.images.services.walk.image(width: width / 2, height: height, fit: BoxFit.cover, package: 'vox_ui_kit'),
          ),
        ],
      ),
    );
  }
}
