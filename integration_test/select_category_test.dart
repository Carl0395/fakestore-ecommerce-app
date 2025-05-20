import 'package:fake_e_commerce/features/products/presentation/pages/products/products_page.dart';
import 'package:fake_e_commerce/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Select category tap test', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(ProductsPage), findsOneWidget);

    final electronicsTag = find.text('electronics');
    await tester.tap(electronicsTag);
    await tester.pumpAndSettle();

    // await tester.dragUntilVisible(
    //   find.byKey(const Key('card_9')),
    //   find.byKey(const Key('products_grid')),
    //   Offset(0, -100),
    // );

    expect(find.byKey(Key('card_9')), findsOneWidget);
  });
}
