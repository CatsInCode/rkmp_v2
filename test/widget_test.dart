import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rkmp/main.dart';

void main() {
  testWidgets('loading screen shows EasyFlat branding', (WidgetTester tester) async {
    await tester.pumpWidget(const ApartmentApp());

    expect(find.text('EasyFlat'), findsOneWidget);
    expect(find.text('Загрузка приложения...'), findsOneWidget);
    expect(find.byIcon(Icons.work_outline), findsOneWidget);
  });
}
