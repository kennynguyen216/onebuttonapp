import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onebuttonapp/main.dart';

void main() {
  testWidgets('Button can be pressed without changing the screen', (
    tester,
  ) async {
    await tester.pumpWidget(const OneButtonApp());

    final button = find.widgetWithText(FilledButton, 'Press me');
    expect(button, findsOneWidget);
    expect(tester.widget<FilledButton>(button).onPressed, isNotNull);

    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(button, findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
