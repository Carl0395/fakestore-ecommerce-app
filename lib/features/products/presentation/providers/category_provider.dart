import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

String allCategory = 'All';

@riverpod
class CurrentCategory extends _$CurrentCategory {
  @override
  String build() {
    return allCategory;
  }

  void changeCategory(String category) {
    state = category;
  }
}
