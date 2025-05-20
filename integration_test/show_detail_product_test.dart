import 'package:fake_e_commerce/features/products/presentation/pages/product/product_page.dart';
import 'package:fake_e_commerce/features/products/presentation/pages/products/products_page.dart';
import 'package:fake_e_commerce/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Show detail product test', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(ProductsPage), findsOneWidget);

    await tester.dragUntilVisible(
      find.byKey(const Key('card_14')),
      find.byKey(const Key('products_grid')),
      Offset(0, -800),
    );

    expect(find.byKey(Key('card_14')), findsOneWidget);

    await tester.tap(find.byKey(Key('card_14')));
    await tester.pumpAndSettle();

    expect(find.byType(ProductPage), findsOneWidget);
  });
}
