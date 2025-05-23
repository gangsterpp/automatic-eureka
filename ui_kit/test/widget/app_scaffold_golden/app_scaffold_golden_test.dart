import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:vox_ui_kit/widgets/app_scaffold.dart';

import '../../flutter_test_config.dart';
import '../../iphone_screen_sizes.dart';
import '../../test_material_wrapper.dart';

void main() {
  for (final screenSize in iphoneScreenSizes) {
    testGoldens('AppScaffold, ${screenSize.name}', (tester) async {
      await testExecutable(() async {
        await tester.pumpWidgetBuilder(
          AppScaffold(
            title: Text('Длинное название страницы ${screenSize.name}'),
            builder: (context) => Container(color: Colors.black, margin: const EdgeInsets.only(top: 8)),
          ),
          surfaceSize: Size(screenSize.width, screenSize.height),
          wrapper: testMaterialWrapper,
        );
        await screenMatchesGolden(tester, 'app_scaffold_${screenSize.name}_${screenSize.width}x${screenSize.height}');
      });
    });
  }
}
