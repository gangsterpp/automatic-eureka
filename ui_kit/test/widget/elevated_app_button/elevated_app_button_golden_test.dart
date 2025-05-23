import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:vox_ui_kit/components/elevated_app_button.dart';
import 'package:vox_ui_kit/widgets/app_scaffold.dart';

import '../../iphone_screen_sizes.dart';
import '../../test_material_wrapper.dart';

void main() async {
  await loadAppFonts();
  for (final screenSize in iphoneScreenSizes) {
    testGoldens('ElevatedAppButton initial, ${screenSize.name}', (tester) async {
      await tester.pumpWidgetBuilder(
        AppScaffold(builder: (c) => Center(child: ElevatedAppButton(onPressed: () {}, child: Text('Primary')))),
        surfaceSize: Size(screenSize.width, screenSize.height),
        wrapper: testMaterialWrapper,
      );
      await screenMatchesGolden(tester, 'elevated_app_button_initial_${screenSize.name}_${screenSize.width}x${screenSize.height}');
    });

    testGoldens('ElevatedAppButton disabled, ${screenSize.name}', (tester) async {
      await tester.pumpWidgetBuilder(
        AppScaffold(builder: (c) => Center(child: ElevatedAppButton(onPressed: null, child: Text('Primary')))),
        surfaceSize: Size(screenSize.width, screenSize.height),
        wrapper: testMaterialWrapper,
      );
      await screenMatchesGolden(tester, 'elevated_app_button_disabled_${screenSize.name}_${screenSize.width}x${screenSize.height}');
    });

    testGoldens('ElevatedAppButton pressed, ${screenSize.name}', (tester) async {
      await tester.pumpWidgetBuilder(
        AppScaffold(builder: (c) => Center(child: ElevatedAppButton(onPressed: () {}, child: Text('Primary')))),
        surfaceSize: Size(screenSize.width, screenSize.height),
        wrapper: testMaterialWrapper,
      );
      final gesture = await tester.startGesture(tester.getCenter(find.byType(ElevatedAppButton)));
      await screenMatchesGolden(tester, 'elevated_app_button_pressed_${screenSize.name}_${screenSize.width}x${screenSize.height}');

      await gesture.up();
    });
  }
}
