import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:vox_ui_kit/widgets/buttons/filled/primary_filled_button.dart';

import '../../iphone_screen_sizes.dart';
import '../../test_material_wrapper.dart';

void main() {
  for (final screenSize in iphoneScreenSizes) {
    testGoldens('PrimaryFilledButton, ${screenSize.name}', (tester) async {
      await tester.pumpWidgetBuilder(
        Center(child: PrimaryFilledButton(title: 'PrimaryFilledButton', onPressed: () {})),
        surfaceSize: Size(screenSize.width, screenSize.height),
        wrapper: testMaterialWrapper,
      );
      await screenMatchesGolden(tester, 'primary_filled_button_${screenSize.name}_${screenSize.width}x${screenSize.height}');
    });
  }
}
