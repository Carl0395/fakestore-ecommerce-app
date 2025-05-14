import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_query_provider.g.dart';

@riverpod
class FilterQuery extends _$FilterQuery {
  @override
  String build() {
    return '';
  }

  void changeQuery(String query) {
    state = query;
  }
}
