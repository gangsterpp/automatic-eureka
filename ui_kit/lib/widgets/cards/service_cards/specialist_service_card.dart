import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';

import '../service_card.dart';

class SpecialistServiceCard extends ServiceCard {
  final bool isVet;
  const SpecialistServiceCard({super.key, required super.text, required super.color, required super.textWithBorder, this.isVet = false});

  @override
  Widget image(BuildContext contex, double scaleHeight, double scaleWidth, double width, double height) {
    if (isVet) {
      return Positioned(
        bottom: 0,
        right: -width / 10,
        child: Assets.images.services.vet.image(width: width / 2.049, height: width / 1.886, fit: BoxFit.contain, package: 'vox_ui_kit'),
      );
    }
    return Positioned(
      bottom: 0,
      right: -width / 1.908 / 3,
      child: Assets.images.services.many.image(width: width / 1.908, height: width / 1.551, fit: BoxFit.contain, package: 'vox_ui_kit'),
    );
  }
}
