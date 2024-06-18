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
String _$myReceiptsHash() => r'bdaa9279829eb3809990b3acffca6d3e96c05f62';

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

String _$searchReceiptsHash() => r'ba35b4705c69eb33f8514db0807a6526a67f1d4f';

/// See also [searchReceipts].
@ProviderFor(searchReceipts)
const searchReceiptsProvider = SearchReceiptsFamily();

/// See also [searchReceipts].
class SearchReceiptsFamily extends Family<AsyncValue<MyReceiptsResults>> {
  /// See also [searchReceipts].
  const SearchReceiptsFamily();

  /// See also [searchReceipts].
  SearchReceiptsProvider call({
    String? customerName,
    DateTime? startDate,
    DateTime? endDate,
    num? maxmum,
    num? minimum,
    PaymentType? paymentType,
    String? tin,
    int page = 1,
    int size = 50,
  }) {
    return SearchReceiptsProvider(
      customerName: customerName,
      startDate: startDate,
      endDate: endDate,
      maxmum: maxmum,
      minimum: minimum,
      paymentType: paymentType,
      tin: tin,
      page: page,
      size: size,
    );
  }

  @override
  SearchReceiptsProvider getProviderOverride(
    covariant SearchReceiptsProvider provider,
  ) {
    return call(
      customerName: provider.customerName,
      startDate: provider.startDate,
      endDate: provider.endDate,
      maxmum: provider.maxmum,
      minimum: provider.minimum,
      paymentType: provider.paymentType,
      tin: provider.tin,
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
  String? get name => r'searchReceiptsProvider';
}

/// See also [searchReceipts].
class SearchReceiptsProvider
    extends AutoDisposeFutureProvider<MyReceiptsResults> {
  /// See also [searchReceipts].
  SearchReceiptsProvider({
    String? customerName,
    DateTime? startDate,
    DateTime? endDate,
    num? maxmum,
    num? minimum,
    PaymentType? paymentType,
    String? tin,
    int page = 1,
    int size = 50,
  }) : this._internal(
          (ref) => searchReceipts(
            ref as SearchReceiptsRef,
            customerName: customerName,
            startDate: startDate,
            endDate: endDate,
            maxmum: maxmum,
            minimum: minimum,
            paymentType: paymentType,
            tin: tin,
            page: page,
            size: size,
          ),
          from: searchReceiptsProvider,
          name: r'searchReceiptsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchReceiptsHash,
          dependencies: SearchReceiptsFamily._dependencies,
          allTransitiveDependencies:
              SearchReceiptsFamily._allTransitiveDependencies,
          customerName: customerName,
          startDate: startDate,
          endDate: endDate,
          maxmum: maxmum,
          minimum: minimum,
          paymentType: paymentType,
          tin: tin,
          page: page,
          size: size,
        );

  SearchReceiptsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerName,
    required this.startDate,
    required this.endDate,
    required this.maxmum,
    required this.minimum,
    required this.paymentType,
    required this.tin,
    required this.page,
    required this.size,
  }) : super.internal();

  final String? customerName;
  final DateTime? startDate;
  final DateTime? endDate;
  final num? maxmum;
  final num? minimum;
  final PaymentType? paymentType;
  final String? tin;
  final int page;
  final int size;

  @override
  Override overrideWith(
    FutureOr<MyReceiptsResults> Function(SearchReceiptsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchReceiptsProvider._internal(
        (ref) => create(ref as SearchReceiptsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerName: customerName,
        startDate: startDate,
        endDate: endDate,
        maxmum: maxmum,
        minimum: minimum,
        paymentType: paymentType,
        tin: tin,
        page: page,
        size: size,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MyReceiptsResults> createElement() {
    return _SearchReceiptsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchReceiptsProvider &&
        other.customerName == customerName &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.maxmum == maxmum &&
        other.minimum == minimum &&
        other.paymentType == paymentType &&
        other.tin == tin &&
        other.page == page &&
        other.size == size;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerName.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, maxmum.hashCode);
    hash = _SystemHash.combine(hash, minimum.hashCode);
    hash = _SystemHash.combine(hash, paymentType.hashCode);
    hash = _SystemHash.combine(hash, tin.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, size.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchReceiptsRef on AutoDisposeFutureProviderRef<MyReceiptsResults> {
  /// The parameter `customerName` of this provider.
  String? get customerName;

  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;

  /// The parameter `maxmum` of this provider.
  num? get maxmum;

  /// The parameter `minimum` of this provider.
  num? get minimum;

  /// The parameter `paymentType` of this provider.
  PaymentType? get paymentType;

  /// The parameter `tin` of this provider.
  String? get tin;

  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `size` of this provider.
  int get size;
}

class _SearchReceiptsProviderElement
    extends AutoDisposeFutureProviderElement<MyReceiptsResults>
    with SearchReceiptsRef {
  _SearchReceiptsProviderElement(super.provider);

  @override
  String? get customerName => (origin as SearchReceiptsProvider).customerName;
  @override
  DateTime? get startDate => (origin as SearchReceiptsProvider).startDate;
  @override
  DateTime? get endDate => (origin as SearchReceiptsProvider).endDate;
  @override
  num? get maxmum => (origin as SearchReceiptsProvider).maxmum;
  @override
  num? get minimum => (origin as SearchReceiptsProvider).minimum;
  @override
  PaymentType? get paymentType =>
      (origin as SearchReceiptsProvider).paymentType;
  @override
  String? get tin => (origin as SearchReceiptsProvider).tin;
  @override
  int get page => (origin as SearchReceiptsProvider).page;
  @override
  int get size => (origin as SearchReceiptsProvider).size;
}

String _$zReportsHash() => r'2b3ed535aaf445a581519ac335ed2198171f4cba';

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

String _$receiptHash() => r'613bcad7b08ce12146280958b25d1ec1a7aa4031';

/// See also [receipt].
@ProviderFor(receipt)
const receiptProvider = ReceiptFamily();

/// See also [receipt].
class ReceiptFamily extends Family<AsyncValue<FullReceipt>> {
  /// See also [receipt].
  const ReceiptFamily();

  /// See also [receipt].
  ReceiptProvider call({
    required Object id,
  }) {
    return ReceiptProvider(
      id: id,
    );
  }

  @override
  ReceiptProvider getProviderOverride(
    covariant ReceiptProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'receiptProvider';
}

/// See also [receipt].
class ReceiptProvider extends AutoDisposeFutureProvider<FullReceipt> {
  /// See also [receipt].
  ReceiptProvider({
    required Object id,
  }) : this._internal(
          (ref) => receipt(
            ref as ReceiptRef,
            id: id,
          ),
          from: receiptProvider,
          name: r'receiptProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$receiptHash,
          dependencies: ReceiptFamily._dependencies,
          allTransitiveDependencies: ReceiptFamily._allTransitiveDependencies,
          id: id,
        );

  ReceiptProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final Object id;

  @override
  Override overrideWith(
    FutureOr<FullReceipt> Function(ReceiptRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReceiptProvider._internal(
        (ref) => create(ref as ReceiptRef),
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
  AutoDisposeFutureProviderElement<FullReceipt> createElement() {
    return _ReceiptProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReceiptProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReceiptRef on AutoDisposeFutureProviderRef<FullReceipt> {
  /// The parameter `id` of this provider.
  Object get id;
}

class _ReceiptProviderElement
    extends AutoDisposeFutureProviderElement<FullReceipt> with ReceiptRef {
  _ReceiptProviderElement(super.provider);

  @override
  Object get id => (origin as ReceiptProvider).id;
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
String _$signUpHash() => r'2b46d8a70358f301caeae10ca2e31e1b80a208ea';

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
String _$userHash() => r'e3999bce3e88a78144871227b35a484d28349420';

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
String _$newReceiptHash() => r'3282b99e399cf09f2e2436ab50f99d8f760a353a';

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
String _$itemsHash() => r'b6a101a61e850cd001f016a79b1ef9a4b4900d7d';

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
String _$customersHash() => r'60d341df6bdcd325de278803dadd0c40e12dec0f';

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
String _$selectedBranchHash() => r'823f039027109d6ebbbd0eb6dd12aa402906370c';

/// See also [SelectedBranch].
@ProviderFor(SelectedBranch)
final selectedBranchProvider =
    AsyncNotifierProvider<SelectedBranch, Branch?>.internal(
  SelectedBranch.new,
  name: r'selectedBranchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedBranchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedBranch = AsyncNotifier<Branch?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
