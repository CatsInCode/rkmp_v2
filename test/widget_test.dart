import 'package:flutter_test/flutter_test.dart';

import 'package:rkmp/main.dart';

void main() {
  testWidgets('renders practical layout content', (WidgetTester tester) async {
    await tester.pumpWidget(const ApartmentFinderApp());

    expect(find.text('ПОДБОР КВАРТИРЫ'), findsOneWidget);
    expect(find.textContaining('Название ПО: EasyFlat'), findsOneWidget);
    expect(find.textContaining('Описание ПО:'), findsOneWidget);
    expect(find.textContaining('Горохов С. А.'), findsOneWidget);
  });
}
