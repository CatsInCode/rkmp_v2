import 'package:flutter_test/flutter_test.dart';

import 'package:rkmp/main.dart';

void main() {
  testWidgets('renders practical #4 lists and shows SnackBar on tap', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ApartmentFinderApp());

    expect(find.text('ПОДБОР КВАРТИРЫ'), findsOneWidget);
    expect(find.byKey(const ValueKey('horizontal-image-list')), findsOneWidget);
    expect(find.byKey(const ValueKey('feature-list')), findsOneWidget);
    expect(find.text('Фильтр по цене'), findsOneWidget);

    await tester.tap(find.text('Фильтр по цене'));
    await tester.pump();

    expect(find.text('Выбран пункт: Фильтр по цене'), findsOneWidget);
  });
}
