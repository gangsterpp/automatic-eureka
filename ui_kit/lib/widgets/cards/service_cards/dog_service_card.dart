import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../service_card.dart';

class DogServiceCard extends ServiceCard {
  @override
  double get widthCoeff => 28.58;
  const DogServiceCard({super.key, required super.text, required super.color, required super.textWithBorder, super.onTap});

  @override
  Widget image(BuildContext contex, double scaleHeight, double scaleWidth, double width, double height) {
    return Positioned(
      right: width / 5.7,
      bottom: 0,
      child: Assets.images.services.walk.image(width: width / 2, height: height, fit: BoxFit.contain, package: 'vox_ui_kit'),
    );
  }
}
