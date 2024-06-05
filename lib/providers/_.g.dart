// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$devicesHash() => r'f5572a6fa90622fd9b5aec81a3dd0cc14c7fe984';

/// See also [_devices].
@ProviderFor(_devices)
final _devicesProvider = StreamProvider<List<BluetoothDevice>>.internal(
  _devices,
  name: r'_devicesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$devicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _DevicesRef = StreamProviderRef<List<BluetoothDevice>>;
String _$deviceConnectedHash() => r'3a820a80a5708ce596951a656a68d3233ceb4091';

/// See also [_deviceConnected].
@ProviderFor(_deviceConnected)
final _deviceConnectedProvider = StreamProvider<bool>.internal(
  _deviceConnected,
  name: r'_deviceConnectedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceConnectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _DeviceConnectedRef = StreamProviderRef<bool>;
String _$myReceiptsHash() => r'd2a1f3d410b7cae4f4bb7538933debac5a601e20';

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

/// See also [myReceipts].
@ProviderFor(myReceipts)
const myReceiptsProvider = MyReceiptsFamily();

/// See also [myReceipts].
class MyReceiptsFamily extends Family<AsyncValue<MyReceiptsResults>> {
  /// See also [myReceipts].
  const MyReceiptsFamily();

  /// See also [myReceipts].
  MyReceiptsProvider call({
    int page = 1,
    int size = 50,
  }) {
    return MyReceiptsProvider(
      page: page,
      size: size,
    );
  }

  @override
  MyReceiptsProvider getProviderOverride(
    covariant MyReceiptsProvider provider,
  ) {
    return call(
      page: provider.page,
      size: provider.size,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'myReceiptsProvider';
}

/// See also [myReceipts].
class MyReceiptsProvider extends AutoDisposeFutureProvider<MyReceiptsResults> {
  /// See also [myReceipts].
  MyReceiptsProvider({
    int page = 1,
    int size = 50,
  }) : this._internal(
          (ref) => myReceipts(
            ref as MyReceiptsRef,
            page: page,
            size: size,
          ),
          from: myReceiptsProvider,
          name: r'myReceiptsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myReceiptsHash,
          dependencies: MyReceiptsFamily._dependencies,
          allTransitiveDependencies:
              MyReceiptsFamily._allTransitiveDependencies,
          page: page,
          size: size,
        );

  MyReceiptsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.size,
  }) : super.internal();

  final int page;
  final int size;

  @override
  Override overrideWith(
    FutureOr<MyReceiptsResults> Function(MyReceiptsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyReceiptsProvider._internal(
        (ref) => create(ref as MyReceiptsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        size: size,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MyReceiptsResults> createElement() {
    return _MyReceiptsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyReceiptsProvider &&
        other.page == page &&
        other.size == size;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, size.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyReceiptsRef on AutoDisposeFutureProviderRef<MyReceiptsResults> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `size` of this provider.
  int get size;
}

class _MyReceiptsProviderElement
    extends AutoDisposeFutureProviderElement<MyReceiptsResults>
    with MyReceiptsRef {
  _MyReceiptsProviderElement(super.provider);

  @override
  int get page => (origin as MyReceiptsProvider).page;
  @override
  int get size => (origin as MyReceiptsProvider).size;
}

String _$zReportsHash() => r'ac3bf1c92d0b78e0e1133e253acb5212d87b57eb';

/// See also [zReports].
@ProviderFor(zReports)
const zReportsProvider = ZReportsFamily();

/// See also [zReports].
class ZReportsFamily extends Family<AsyncValue<ZReportsResult>> {
  /// See also [zReports].
  const ZReportsFamily();

  /// See also [zReports].
  ZReportsProvider call({
    int page = 1,
    int size = 50,
  }) {
    return ZReportsProvider(
      page: page,
      size: size,
    );
  }

  @override
  ZReportsProvider getProviderOverride(
    covariant ZReportsProvider provider,
  ) {
    return call(
      page: provider.page,
      size: provider.size,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'zReportsProvider';
}

/// See also [zReports].
class ZReportsProvider extends AutoDisposeFutureProvider<ZReportsResult> {
  /// See also [zReports].
  ZReportsProvider({
    int page = 1,
    int size = 50,
  }) : this._internal(
          (ref) => zReports(
            ref as ZReportsRef,
            page: page,
            size: size,
          ),
          from: zReportsProvider,
          name: r'zReportsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$zReportsHash,
          dependencies: ZReportsFamily._dependencies,
          allTransitiveDependencies: ZReportsFamily._allTransitiveDependencies,
          page: page,
          size: size,
        );

  ZReportsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.size,
  }) : super.internal();

  final int page;
  final int size;

  @override
  Override overrideWith(
    FutureOr<ZReportsResult> Function(ZReportsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ZReportsProvider._internal(
        (ref) => create(ref as ZReportsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        size: size,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ZReportsResult> createElement() {
    return _ZReportsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ZReportsProvider &&
        other.page == page &&
        other.size == size;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, size.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ZReportsRef on AutoDisposeFutureProviderRef<ZReportsResult> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `size` of this provider.
  int get size;
}

class _ZReportsProviderElement
    extends AutoDisposeFutureProviderElement<ZReportsResult> with ZReportsRef {
  _ZReportsProviderElement(super.provider);

  @override
  int get page => (origin as ZReportsProvider).page;
  @override
  int get size => (origin as ZReportsProvider).size;
}

String _$resendVerificationHash() =>
    r'd867c94632a102cc45c32cf57e4063ed4b4bd673';

/// See also [resendVerification].
@ProviderFor(resendVerification)
const resendVerificationProvider = ResendVerificationFamily();

/// See also [resendVerification].
class ResendVerificationFamily extends Family<AsyncValue<bool>> {
  /// See also [resendVerification].
  const ResendVerificationFamily();

  /// See also [resendVerification].
  ResendVerificationProvider call({
    required String email,
  }) {
    return ResendVerificationProvider(
      email: email,
    );
  }

  @override
  ResendVerificationProvider getProviderOverride(
    covariant ResendVerificationProvider provider,
  ) {
    return call(
      email: provider.email,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'resendVerificationProvider';
}

/// See also [resendVerification].
class ResendVerificationProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [resendVerification].
  ResendVerificationProvider({
    required String email,
  }) : this._internal(
          (ref) => resendVerification(
            ref as ResendVerificationRef,
            email: email,
          ),
          from: resendVerificationProvider,
          name: r'resendVerificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resendVerificationHash,
          dependencies: ResendVerificationFamily._dependencies,
          allTransitiveDependencies:
              ResendVerificationFamily._allTransitiveDependencies,
          email: email,
        );

  ResendVerificationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ResendVerificationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResendVerificationProvider._internal(
        (ref) => create(ref as ResendVerificationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ResendVerificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResendVerificationProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ResendVerificationRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `email` of this provider.
  String get email;
}

class _ResendVerificationProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ResendVerificationRef {
  _ResendVerificationProviderElement(super.provider);

  @override
  String get email => (origin as ResendVerificationProvider).email;
}

String _$loginHash() => r'a10cddb950c29f18ea553e10e53687fd1df5dc2b';

/// See also [Login].
@ProviderFor(Login)
final loginProvider =
    AutoDisposeAsyncNotifierProvider<Login, LoginState>.internal(
  Login.new,
  name: r'loginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Login = AutoDisposeAsyncNotifier<LoginState>;
String _$signUpHash() => r'300f14126f769c7574195c4f1f5653c7bbb182d5';

/// See also [SignUp].
@ProviderFor(SignUp)
final signUpProvider =
    AutoDisposeAsyncNotifierProvider<SignUp, SignUpState>.internal(
  SignUp.new,
  name: r'signUpProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signUpHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignUp = AutoDisposeAsyncNotifier<SignUpState>;
String _$userHash() => r'a6781a60f77cb51b4d270c974df443e5acad4a5c';

/// See also [User].
@ProviderFor(User)
final userProvider = AsyncNotifierProvider<User, UserInfo?>.internal(
  User.new,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$User = AsyncNotifier<UserInfo?>;
String _$newReceiptHash() => r'faa13c0eebea22b1fc4a9721d4b0189bd54be34d';

/// See also [NewReceipt].
@ProviderFor(NewReceipt)
final newReceiptProvider =
    AsyncNotifierProvider<NewReceipt, NewReceiptState>.internal(
  NewReceipt.new,
  name: r'newReceiptProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newReceiptHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewReceipt = AsyncNotifier<NewReceiptState>;
String _$itemsHash() => r'55f59a1e6a2efc68fb70d44e107a67ed478229ba';

/// See also [Items].
@ProviderFor(Items)
final itemsProvider = StreamNotifierProvider<Items, ItemsState>.internal(
  Items.new,
  name: r'itemsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Items = StreamNotifier<ItemsState>;
String _$customersHash() => r'2d525ace204d7429caabf3be2641f22707504483';

/// See also [Customers].
@ProviderFor(Customers)
final customersProvider =
    StreamNotifierProvider<Customers, CustomersState>.internal(
  Customers.new,
  name: r'customersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$customersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Customers = StreamNotifier<CustomersState>;
String _$printerHash() => r'a00d3d7e4bcc7f7bdf6b2acf860a688c5d2cab21';

/// See also [Printer].
@ProviderFor(Printer)
final printerProvider = StreamNotifierProvider<Printer, PrinterState>.internal(
  Printer.new,
  name: r'printerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$printerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Printer = StreamNotifier<PrinterState>;
String _$deleteAccountHash() => r'2ede25cf0de2c6d36b29640467269d195602303a';

/// See also [DeleteAccount].
@ProviderFor(DeleteAccount)
final deleteAccountProvider =
    AutoDisposeAsyncNotifierProvider<DeleteAccount, bool?>.internal(
  DeleteAccount.new,
  name: r'deleteAccountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeleteAccount = AutoDisposeAsyncNotifier<bool?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
