import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../service_card.dart';

enum DayNany { dog, cat, other, many }

class DayNanyCard extends ServiceCard {
  final DayNany dayNany;
  const DayNanyCard({super.key, required super.text, required super.color, this.dayNany = DayNany.dog});

  @override
  Widget image(BuildContext contex, double scaleHeight, double scaleWidth, double width, double height) {
    return switch (dayNany) {
      DayNany.dog => Positioned(
        bottom: 0,
        right: 0,
        child: Assets.images.services.dayNanny.image(width: width / 1.78, height: width / 1.84, fit: BoxFit.contain, package: 'vox_ui_kit'),
      ),

      DayNany.cat => Positioned(
        bottom: 0,
        right: 0,
        child: Assets.images.services.catDayNanny.image(
          width: width / 1.86,
          height: width / 1.93,
          fit: BoxFit.contain,
          package: 'vox_ui_kit',
        ),
      ),

      DayNany.other => Positioned(
        bottom: 0,
        right: 0,
        child: Assets.images.services.petsDayNanny.image(
          width: width / 2.075,
          height: width / 1.93,
          fit: BoxFit.contain,
          package: 'vox_ui_kit',
        ),
      ),

      DayNany.many => Positioned(
        bottom: 0,
        right: 0,
        child: Assets.images.services.otherDayNanny.image(
          width: width / 1.78,
          height: width / 1.804,
          fit: BoxFit.contain,
          package: 'vox_ui_kit',
        ),
      ),
    };
  }
}
