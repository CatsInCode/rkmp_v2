import 'package:flutter_test/flutter_test.dart';

import 'package:rkmp/main.dart';

void main() {
  testWidgets('login page renders and validates fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ApartmentAuthApp());

    expect(find.textContaining('Добро пожаловать'), findsOneWidget);
    expect(find.text('Войти'), findsOneWidget);

    await tester.tap(find.text('Войти'));
    await tester.pump();

    expect(find.text('Поле не может быть пустым'), findsNWidgets(2));
  });
}
