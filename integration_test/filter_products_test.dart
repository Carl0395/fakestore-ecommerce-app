import 'package:ecommerce_system_design/molecules/search.dart';
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

    final search = find.byType(Search);
    await tester.enterText(search, 'Ring');
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('card_7')), findsOneWidget);
  });
}
