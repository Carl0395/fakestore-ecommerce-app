// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCartByIdHash() => r'6789bbbe146e429a507f0b62ffab9814f66aaa36';

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

/// See also [getCartById].
@ProviderFor(getCartById)
const getCartByIdProvider = GetCartByIdFamily();

/// See also [getCartById].
class GetCartByIdFamily extends Family<AsyncValue<CartModel>> {
  /// See also [getCartById].
  const GetCartByIdFamily();

  /// See also [getCartById].
  GetCartByIdProvider call(String id) {
    return GetCartByIdProvider(id);
  }

  @override
  GetCartByIdProvider getProviderOverride(
    covariant GetCartByIdProvider provider,
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
  String? get name => r'getCartByIdProvider';
}

/// See also [getCartById].
class GetCartByIdProvider extends FutureProvider<CartModel> {
  /// See also [getCartById].
  GetCartByIdProvider(String id)
    : this._internal(
        (ref) => getCartById(ref as GetCartByIdRef, id),
        from: getCartByIdProvider,
        name: r'getCartByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getCartByIdHash,
        dependencies: GetCartByIdFamily._dependencies,
        allTransitiveDependencies: GetCartByIdFamily._allTransitiveDependencies,
        id: id,
      );

  GetCartByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<CartModel> Function(GetCartByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCartByIdProvider._internal(
        (ref) => create(ref as GetCartByIdRef),
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
  FutureProviderElement<CartModel> createElement() {
    return _GetCartByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCartByIdProvider && other.id == id;
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
mixin GetCartByIdRef on FutureProviderRef<CartModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetCartByIdProviderElement extends FutureProviderElement<CartModel>
    with GetCartByIdRef {
  _GetCartByIdProviderElement(super.provider);

  @override
  String get id => (origin as GetCartByIdProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
