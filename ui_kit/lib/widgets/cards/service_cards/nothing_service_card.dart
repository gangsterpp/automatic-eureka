import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../service_card.dart';

class NothingServiceCard extends ServiceCard {
  const NothingServiceCard({super.key, required super.text, required super.color, super.onTap});

  @override
  Widget image(BuildContext contex, double scaleHeight, double scaleWidth, double width, double height) {
    return Positioned(
      top: width / 1.95 / 3,
      right: -height / 1.3 / 10,
      child: Assets.images.services.what.image(width: height / 1.3, height: width / 1.95, fit: BoxFit.contain, package: 'vox_ui_kit'),
    );
  }
}
