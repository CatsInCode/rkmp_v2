import 'package:flutter_test/flutter_test.dart';

import 'package:rkmp/main.dart';

void main() {
  testWidgets('renders practical layout content and cycles images', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ApartmentFinderApp());

    expect(find.text('ПОДБОР КВАРТИРЫ'), findsOneWidget);
    expect(find.textContaining('Название ПО: EasyFlat'), findsOneWidget);
    expect(find.textContaining('Описание ПО:'), findsOneWidget);
    expect(find.byKey(const ValueKey('image-index-label')), findsOneWidget);
    expect(find.text('Кадр 1/5'), findsOneWidget);

    await tester.tap(find.text('Следующее изображение'));
    await tester.pump();
    expect(find.text('Кадр 2/5'), findsOneWidget);

    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();
    expect(find.text('Кадр 3/5'), findsOneWidget);
  });
}
