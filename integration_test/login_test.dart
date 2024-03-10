import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_example/home_page.dart';
import 'package:integration_test_example/main.dart';

void main() {
  group('Integration tests for login', () {
    Future<void> delay({Duration duration = const Duration(seconds: 2)}) async {
      await Future.delayed(duration);
    }

    testWidgets('Verify proper login to the app', (test) async {
      await test.pumpWidget(const MyApp());
      await delay();
      await test.enterText(find.byKey(const ValueKey('username_field_key')), 'admin');
      await delay();

      await test.enterText(find.byKey(const ValueKey('password_field_key')), 'admin1234');
      await delay();

      await test.tap(find.byKey(const ValueKey('login_button_key')));
      await delay();

      await test.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
      expect(find.text('You are logged in!'), findsOneWidget);
    });

    testWidgets('Invalid username and password', (test) async {
      await test.pumpWidget(const MyApp());
      await delay();
      await test.enterText(find.byKey(const ValueKey('username_field_key')), 'admin1');
      await delay();

      await test.enterText(find.byKey(const ValueKey('password_field_key')), 'admin');
      await delay();
      await test.tap(find.byKey(const ValueKey('login_button_key')));
      await delay();

      await test.pumpAndSettle();
      expect(find.text('Invalid username or password'), findsNWidgets(2));
    });
  });
}
