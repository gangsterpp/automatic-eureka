import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../service_card.dart';

class PetSittingsCard extends ServiceCard {
  final bool isDog;
  const PetSittingsCard({super.key, required super.text, required super.color, this.isDog = true});

  @override
  Widget image(BuildContext contex, double scaleHeight, double scaleWidth, double width, double height) {
    if (isDog) {
      return Positioned(
        bottom: 0,
        right: 0,
        child: Assets.images.services.petSitting.image(
          width: width / 1.84,
          height: width / 1.84,
          fit: BoxFit.contain,
          package: 'vox_ui_kit',
        ),
      );
    }
    return Positioned(
      bottom: 0,
      right: 0,
      child: Assets.images.services.catPetSitting.image(
        width: width / 1.62,
        height: width / 2.075,
        fit: BoxFit.contain,
        package: 'vox_ui_kit',
      ),
    );
  }
}
