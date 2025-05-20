import 'package:fake_e_commerce/features/cart/presentation/pages/cart_page.dart';
import 'package:fake_e_commerce/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Show cart', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final cartButton = find.byKey(const Key('cart_button'));

    await tester.tap(cartButton);
    await tester.pumpAndSettle();

    expect(find.byType(CartPage), findsOneWidget);
    await tester.pump(Duration(seconds: 2));

    expect(find.byKey(const Key('cart_item_1')), findsOneWidget);
  });
}
