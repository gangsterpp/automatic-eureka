import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:vox_ui_kit/components/primary_button.dart';

import '../../iphone_screen_sizes.dart';
import '../../test_material_wrapper.dart';

void main() {
  for (final screenSize in iphoneScreenSizes) {
    testGoldens('PrimaryButton, ${screenSize.name}', (tester) async {
      await tester.pumpWidgetBuilder(
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: double.infinity, maxHeight: 44),
            child: PrimaryButton(text: 'PrimaryButton', onPressed: () {}),
          ),
        ),
        surfaceSize: Size(screenSize.width, screenSize.height),
        wrapper: testMaterialWrapper,
      );
      await screenMatchesGolden(tester, 'primary_button_${screenSize.name}_${screenSize.width}x${screenSize.height}');
    });
  }
}
