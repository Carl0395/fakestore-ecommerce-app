// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsHash() => r'02e46a9cff4dd67b6b8807391e674b098e7b6b4b';

/// See also [getProducts].
@ProviderFor(getProducts)
final getProductsProvider = FutureProvider<List<ProductModel>>.internal(
  getProducts,
  name: r'getProductsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProductsRef = FutureProviderRef<List<ProductModel>>;
String _$getCategoriesHash() => r'83bd77c29a941dde44e3f279a9067ea7902d0f68';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider = AutoDisposeFutureProvider<List<String>>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCategoriesRef = AutoDisposeFutureProviderRef<List<String>>;
String _$getProductsByCategoryAndQueryHash() =>
    r'136871b87ffb6961519197543d81f99f4a99ca42';

/// See also [getProductsByCategoryAndQuery].
@ProviderFor(getProductsByCategoryAndQuery)
final getProductsByCategoryAndQueryProvider =
    AutoDisposeFutureProvider<List<ProductModel>>.internal(
      getProductsByCategoryAndQuery,
      name: r'getProductsByCategoryAndQueryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$getProductsByCategoryAndQueryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProductsByCategoryAndQueryRef =
    AutoDisposeFutureProviderRef<List<ProductModel>>;
String _$getProductByIdHash() => r'0e0a5586578e05220bcd177ebf43b1dd275fe082';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getProductById].
@ProviderFor(getProductById)
const getProductByIdProvider = GetProductByIdFamily();

/// See also [getProductById].
class GetProductByIdFamily extends Family<AsyncValue<ProductModel?>> {
  /// See also [getProductById].
  const GetProductByIdFamily();

  /// See also [getProductById].
  GetProductByIdProvider call(int id) {
    return GetProductByIdProvider(id);
  }

  @override
  GetProductByIdProvider getProviderOverride(
    covariant GetProductByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getProductByIdProvider';
}

/// See also [getProductById].
class GetProductByIdProvider extends FutureProvider<ProductModel?> {
  /// See also [getProductById].
  GetProductByIdProvider(int id)
    : this._internal(
        (ref) => getProductById(ref as GetProductByIdRef, id),
        from: getProductByIdProvider,
        name: r'getProductByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getProductByIdHash,
        dependencies: GetProductByIdFamily._dependencies,
        allTransitiveDependencies:
            GetProductByIdFamily._allTransitiveDependencies,
        id: id,
      );

  GetProductByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<ProductModel?> Function(GetProductByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductByIdProvider._internal(
        (ref) => create(ref as GetProductByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<ProductModel?> createElement() {
    return _GetProductByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetProductByIdRef on FutureProviderRef<ProductModel?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetProductByIdProviderElement
    extends FutureProviderElement<ProductModel?>
    with GetProductByIdRef {
  _GetProductByIdProviderElement(super.provider);

  @override
  int get id => (origin as GetProductByIdProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
