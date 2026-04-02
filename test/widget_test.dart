import 'package:flutter_test/flutter_test.dart';

import 'package:rkmp/main.dart';

void main() {
  testWidgets('welcome screen renders main actions', (WidgetTester tester) async {
    await tester.pumpWidget(const ApartmentAuthApp());

    expect(find.text('Добро пожаловать в EasyFlat'), findsOneWidget);
    expect(find.text('Войти'), findsOneWidget);
    expect(find.text('Регистрация'), findsOneWidget);
  });
}
