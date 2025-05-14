// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInHash() => r'a235dd82d4ed74183f40d06e038f0c283976cb21';

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

/// See also [signIn].
@ProviderFor(signIn)
const signInProvider = SignInFamily();

/// See also [signIn].
class SignInFamily extends Family<AsyncValue<String>> {
  /// See also [signIn].
  const SignInFamily();

  /// See also [signIn].
  SignInProvider call(String username, String password) {
    return SignInProvider(username, password);
  }

  @override
  SignInProvider getProviderOverride(covariant SignInProvider provider) {
    return call(provider.username, provider.password);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signInProvider';
}

/// See also [signIn].
class SignInProvider extends AutoDisposeFutureProvider<String> {
  /// See also [signIn].
  SignInProvider(String username, String password)
    : this._internal(
        (ref) => signIn(ref as SignInRef, username, password),
        from: signInProvider,
        name: r'signInProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product') ? null : _$signInHash,
        dependencies: SignInFamily._dependencies,
        allTransitiveDependencies: SignInFamily._allTransitiveDependencies,
        username: username,
        password: password,
      );

  SignInProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.password,
  }) : super.internal();

  final String username;
  final String password;

  @override
  Override overrideWith(FutureOr<String> Function(SignInRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: SignInProvider._internal(
        (ref) => create(ref as SignInRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _SignInProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInProvider &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignInRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `password` of this provider.
  String get password;
}

class _SignInProviderElement extends AutoDisposeFutureProviderElement<String>
    with SignInRef {
  _SignInProviderElement(super.provider);

  @override
  String get username => (origin as SignInProvider).username;
  @override
  String get password => (origin as SignInProvider).password;
}

String _$signUpHash() => r'2d219f5ea0dae11a3f5e36eff5b277ef2d7d581d';

/// See also [signUp].
@ProviderFor(signUp)
const signUpProvider = SignUpFamily();

/// See also [signUp].
class SignUpFamily extends Family<AsyncValue<int>> {
  /// See also [signUp].
  const SignUpFamily();

  /// See also [signUp].
  SignUpProvider call(String username, String email, String password) {
    return SignUpProvider(username, email, password);
  }

  @override
  SignUpProvider getProviderOverride(covariant SignUpProvider provider) {
    return call(provider.username, provider.email, provider.password);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signUpProvider';
}

/// See also [signUp].
class SignUpProvider extends AutoDisposeFutureProvider<int> {
  /// See also [signUp].
  SignUpProvider(String username, String email, String password)
    : this._internal(
        (ref) => signUp(ref as SignUpRef, username, email, password),
        from: signUpProvider,
        name: r'signUpProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product') ? null : _$signUpHash,
        dependencies: SignUpFamily._dependencies,
        allTransitiveDependencies: SignUpFamily._allTransitiveDependencies,
        username: username,
        email: email,
        password: password,
      );

  SignUpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.email,
    required this.password,
  }) : super.internal();

  final String username;
  final String email;
  final String password;

  @override
  Override overrideWith(FutureOr<int> Function(SignUpRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: SignUpProvider._internal(
        (ref) => create(ref as SignUpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _SignUpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpProvider &&
        other.username == username &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignUpRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _SignUpProviderElement extends AutoDisposeFutureProviderElement<int>
    with SignUpRef {
  _SignUpProviderElement(super.provider);

  @override
  String get username => (origin as SignUpProvider).username;
  @override
  String get email => (origin as SignUpProvider).email;
  @override
  String get password => (origin as SignUpProvider).password;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
