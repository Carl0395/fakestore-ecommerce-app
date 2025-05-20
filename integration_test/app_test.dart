import 'package:integration_test/integration_test.dart';
import 'select_category_test.dart' as category;
import 'show_detail_product_test.dart' as detail;
import 'navigate_to_cart_test.dart' as cart;

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  category.main();
  detail.main();
  cart.main();
}
