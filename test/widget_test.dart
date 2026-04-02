import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rkmp/main.dart';

void main() {
  testWidgets('loading screen is shown first', (WidgetTester tester) async {
    await tester.pumpWidget(const ApartmentApp());

    expect(find.text('НАЗВАНИЕ ПРИЛОЖЕНИЯ'), findsOneWidget);
    expect(find.byIcon(Icons.apartment), findsOneWidget);
  });
}
