// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_dock_mobile/screens/login.dart';

void main() {

  Widget makeWidgetTestable({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Login Screen', (WidgetTester tester) async {
    LoginScreen screen = LoginScreen();
    await tester.pumpWidget(makeWidgetTestable(child: screen));
  });
}
