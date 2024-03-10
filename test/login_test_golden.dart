import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:integration_test_example/main.dart';

void main() {
  group('Golden test login page', () {
    testGoldens('Proper login test', (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
            widget: const MyApp(),
            name: 'Proper login test',
            onCreate: (key) async {
              final finder = find.descendant(
                of: find.byKey(key),
                matching: find.byKey(const Key('login_button_key')),
              );
              expect(finder, findsOneWidget);

              await tester.tap(finder);
            });
      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'flutter_demo_page_multiple_scenarios');
    });
  });
}
