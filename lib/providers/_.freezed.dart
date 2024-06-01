// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '_.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginStateImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl extends _LoginState with DiagnosticableTreeMixin {
  const _$LoginStateImpl({required this.email, required this.password})
      : super._();

  @override
  final String email;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState(email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  const factory _LoginState(
      {required final String email,
      required final String password}) = _$LoginStateImpl;
  const _LoginState._() : super._();

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpState {
  String? get message => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String get tin => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {String? message,
      String businessName,
      String tin,
      String email,
      String phoneNumber,
      String password,
      String confirmPassword});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? businessName = null,
    Object? tin = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      tin: null == tin
          ? _value.tin
          : tin // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
          _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
      __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      String businessName,
      String tin,
      String email,
      String phoneNumber,
      String password,
      String confirmPassword});
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
      _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? businessName = null,
    Object? tin = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$SignUpStateImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      tin: null == tin
          ? _value.tin
          : tin // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpStateImpl extends _SignUpState with DiagnosticableTreeMixin {
  const _$SignUpStateImpl(
      {this.message,
      required this.businessName,
      required this.tin,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.confirmPassword})
      : super._();

  @override
  final String? message;
  @override
  final String businessName;
  @override
  final String tin;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState(message: $message, businessName: $businessName, tin: $tin, email: $email, phoneNumber: $phoneNumber, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('businessName', businessName))
      ..add(DiagnosticsProperty('tin', tin))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('confirmPassword', confirmPassword));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.tin, tin) || other.tin == tin) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, businessName, tin,
      email, phoneNumber, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState extends SignUpState {
  const factory _SignUpState(
      {final String? message,
      required final String businessName,
      required final String tin,
      required final String email,
      required final String phoneNumber,
      required final String password,
      required final String confirmPassword}) = _$SignUpStateImpl;
  const _SignUpState._() : super._();

  @override
  String? get message;
  @override
  String get businessName;
  @override
  String get tin;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewReceiptState {
  int get currentStep => throw _privateConstructorUsedError;
  CustomersState get customersState => throw _privateConstructorUsedError;
  PaymentType get paymentType => throw _privateConstructorUsedError;
  ItemsState get itemsState => throw _privateConstructorUsedError;
  ReceiptResult? get result => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewReceiptStateCopyWith<NewReceiptState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewReceiptStateCopyWith<$Res> {
  factory $NewReceiptStateCopyWith(
          NewReceiptState value, $Res Function(NewReceiptState) then) =
      _$NewReceiptStateCopyWithImpl<$Res, NewReceiptState>;
  @useResult
  $Res call(
      {int currentStep,
      CustomersState customersState,
      PaymentType paymentType,
      ItemsState itemsState,
      ReceiptResult? result});

  $CustomersStateCopyWith<$Res> get customersState;
  $ItemsStateCopyWith<$Res> get itemsState;
}

/// @nodoc
class _$NewReceiptStateCopyWithImpl<$Res, $Val extends NewReceiptState>
    implements $NewReceiptStateCopyWith<$Res> {
  _$NewReceiptStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? customersState = null,
    Object? paymentType = null,
    Object? itemsState = null,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      customersState: null == customersState
          ? _value.customersState
          : customersState // ignore: cast_nullable_to_non_nullable
              as CustomersState,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      itemsState: null == itemsState
          ? _value.itemsState
          : itemsState // ignore: cast_nullable_to_non_nullable
              as ItemsState,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ReceiptResult?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomersStateCopyWith<$Res> get customersState {
    return $CustomersStateCopyWith<$Res>(_value.customersState, (value) {
      return _then(_value.copyWith(customersState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemsStateCopyWith<$Res> get itemsState {
    return $ItemsStateCopyWith<$Res>(_value.itemsState, (value) {
      return _then(_value.copyWith(itemsState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewReceiptStateImplCopyWith<$Res>
    implements $NewReceiptStateCopyWith<$Res> {
  factory _$$NewReceiptStateImplCopyWith(_$NewReceiptStateImpl value,
          $Res Function(_$NewReceiptStateImpl) then) =
      __$$NewReceiptStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentStep,
      CustomersState customersState,
      PaymentType paymentType,
      ItemsState itemsState,
      ReceiptResult? result});

  @override
  $CustomersStateCopyWith<$Res> get customersState;
  @override
  $ItemsStateCopyWith<$Res> get itemsState;
}

/// @nodoc
class __$$NewReceiptStateImplCopyWithImpl<$Res>
    extends _$NewReceiptStateCopyWithImpl<$Res, _$NewReceiptStateImpl>
    implements _$$NewReceiptStateImplCopyWith<$Res> {
  __$$NewReceiptStateImplCopyWithImpl(
      _$NewReceiptStateImpl _value, $Res Function(_$NewReceiptStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? customersState = null,
    Object? paymentType = null,
    Object? itemsState = null,
    Object? result = freezed,
  }) {
    return _then(_$NewReceiptStateImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      customersState: null == customersState
          ? _value.customersState
          : customersState // ignore: cast_nullable_to_non_nullable
              as CustomersState,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      itemsState: null == itemsState
          ? _value.itemsState
          : itemsState // ignore: cast_nullable_to_non_nullable
              as ItemsState,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ReceiptResult?,
    ));
  }
}

/// @nodoc

class _$NewReceiptStateImpl extends _NewReceiptState
    with DiagnosticableTreeMixin {
  const _$NewReceiptStateImpl(
      {this.currentStep = 0,
      required this.customersState,
      this.paymentType = PaymentType.cash,
      required this.itemsState,
      this.result})
      : super._();

  @override
  @JsonKey()
  final int currentStep;
  @override
  final CustomersState customersState;
  @override
  @JsonKey()
  final PaymentType paymentType;
  @override
  final ItemsState itemsState;
  @override
  final ReceiptResult? result;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewReceiptState(currentStep: $currentStep, customersState: $customersState, paymentType: $paymentType, itemsState: $itemsState, result: $result)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NewReceiptState'))
      ..add(DiagnosticsProperty('currentStep', currentStep))
      ..add(DiagnosticsProperty('customersState', customersState))
      ..add(DiagnosticsProperty('paymentType', paymentType))
      ..add(DiagnosticsProperty('itemsState', itemsState))
      ..add(DiagnosticsProperty('result', result));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewReceiptStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.customersState, customersState) ||
                other.customersState == customersState) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.itemsState, itemsState) ||
                other.itemsState == itemsState) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, customersState,
      paymentType, itemsState, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewReceiptStateImplCopyWith<_$NewReceiptStateImpl> get copyWith =>
      __$$NewReceiptStateImplCopyWithImpl<_$NewReceiptStateImpl>(
          this, _$identity);
}

abstract class _NewReceiptState extends NewReceiptState {
  const factory _NewReceiptState(
      {final int currentStep,
      required final CustomersState customersState,
      final PaymentType paymentType,
      required final ItemsState itemsState,
      final ReceiptResult? result}) = _$NewReceiptStateImpl;
  const _NewReceiptState._() : super._();

  @override
  int get currentStep;
  @override
  CustomersState get customersState;
  @override
  PaymentType get paymentType;
  @override
  ItemsState get itemsState;
  @override
  ReceiptResult? get result;
  @override
  @JsonKey(ignore: true)
  _$$NewReceiptStateImplCopyWith<_$NewReceiptStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ItemsState {
  List<Item> get items => throw _privateConstructorUsedError;
  List<SelectedItemState> get selectedItems =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemsStateCopyWith<ItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsStateCopyWith<$Res> {
  factory $ItemsStateCopyWith(
          ItemsState value, $Res Function(ItemsState) then) =
      _$ItemsStateCopyWithImpl<$Res, ItemsState>;
  @useResult
  $Res call({List<Item> items, List<SelectedItemState> selectedItems});
}

/// @nodoc
class _$ItemsStateCopyWithImpl<$Res, $Val extends ItemsState>
    implements $ItemsStateCopyWith<$Res> {
  _$ItemsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? selectedItems = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      selectedItems: null == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<SelectedItemState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemsStateImplCopyWith<$Res>
    implements $ItemsStateCopyWith<$Res> {
  factory _$$ItemsStateImplCopyWith(
          _$ItemsStateImpl value, $Res Function(_$ItemsStateImpl) then) =
      __$$ItemsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Item> items, List<SelectedItemState> selectedItems});
}

/// @nodoc
class __$$ItemsStateImplCopyWithImpl<$Res>
    extends _$ItemsStateCopyWithImpl<$Res, _$ItemsStateImpl>
    implements _$$ItemsStateImplCopyWith<$Res> {
  __$$ItemsStateImplCopyWithImpl(
      _$ItemsStateImpl _value, $Res Function(_$ItemsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? selectedItems = null,
  }) {
    return _then(_$ItemsStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      selectedItems: null == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<SelectedItemState>,
    ));
  }
}

/// @nodoc

class _$ItemsStateImpl extends _ItemsState with DiagnosticableTreeMixin {
  const _$ItemsStateImpl(
      {final List<Item> items = const [],
      final List<SelectedItemState> selectedItems = const []})
      : _items = items,
        _selectedItems = selectedItems,
        super._();

  final List<Item> _items;
  @override
  @JsonKey()
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<SelectedItemState> _selectedItems;
  @override
  @JsonKey()
  List<SelectedItemState> get selectedItems {
    if (_selectedItems is EqualUnmodifiableListView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItems);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemsState(items: $items, selectedItems: $selectedItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemsState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('selectedItems', selectedItems));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemsStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_selectedItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemsStateImplCopyWith<_$ItemsStateImpl> get copyWith =>
      __$$ItemsStateImplCopyWithImpl<_$ItemsStateImpl>(this, _$identity);
}

abstract class _ItemsState extends ItemsState {
  const factory _ItemsState(
      {final List<Item> items,
      final List<SelectedItemState> selectedItems}) = _$ItemsStateImpl;
  const _ItemsState._() : super._();

  @override
  List<Item> get items;
  @override
  List<SelectedItemState> get selectedItems;
  @override
  @JsonKey(ignore: true)
  _$$ItemsStateImplCopyWith<_$ItemsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SelectedItemState {
  Item get item => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedItemStateCopyWith<SelectedItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedItemStateCopyWith<$Res> {
  factory $SelectedItemStateCopyWith(
          SelectedItemState value, $Res Function(SelectedItemState) then) =
      _$SelectedItemStateCopyWithImpl<$Res, SelectedItemState>;
  @useResult
  $Res call({Item item, double discount, double quantity});
}

/// @nodoc
class _$SelectedItemStateCopyWithImpl<$Res, $Val extends SelectedItemState>
    implements $SelectedItemStateCopyWith<$Res> {
  _$SelectedItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? discount = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedItemStateImplCopyWith<$Res>
    implements $SelectedItemStateCopyWith<$Res> {
  factory _$$SelectedItemStateImplCopyWith(_$SelectedItemStateImpl value,
          $Res Function(_$SelectedItemStateImpl) then) =
      __$$SelectedItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Item item, double discount, double quantity});
}

/// @nodoc
class __$$SelectedItemStateImplCopyWithImpl<$Res>
    extends _$SelectedItemStateCopyWithImpl<$Res, _$SelectedItemStateImpl>
    implements _$$SelectedItemStateImplCopyWith<$Res> {
  __$$SelectedItemStateImplCopyWithImpl(_$SelectedItemStateImpl _value,
      $Res Function(_$SelectedItemStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? discount = null,
    Object? quantity = null,
  }) {
    return _then(_$SelectedItemStateImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SelectedItemStateImpl extends _SelectedItemState
    with DiagnosticableTreeMixin {
  const _$SelectedItemStateImpl(
      {required this.item, required this.discount, required this.quantity})
      : super._();

  @override
  final Item item;
  @override
  final double discount;
  @override
  final double quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedItemState(item: $item, discount: $discount, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedItemState'))
      ..add(DiagnosticsProperty('item', item))
      ..add(DiagnosticsProperty('discount', discount))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedItemStateImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, discount, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedItemStateImplCopyWith<_$SelectedItemStateImpl> get copyWith =>
      __$$SelectedItemStateImplCopyWithImpl<_$SelectedItemStateImpl>(
          this, _$identity);
}

abstract class _SelectedItemState extends SelectedItemState {
  const factory _SelectedItemState(
      {required final Item item,
      required final double discount,
      required final double quantity}) = _$SelectedItemStateImpl;
  const _SelectedItemState._() : super._();

  @override
  Item get item;
  @override
  double get discount;
  @override
  double get quantity;
  @override
  @JsonKey(ignore: true)
  _$$SelectedItemStateImplCopyWith<_$SelectedItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomersState {
  List<Customer> get customers => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomersStateCopyWith<CustomersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomersStateCopyWith<$Res> {
  factory $CustomersStateCopyWith(
          CustomersState value, $Res Function(CustomersState) then) =
      _$CustomersStateCopyWithImpl<$Res, CustomersState>;
  @useResult
  $Res call({List<Customer> customers, Customer? customer});
}

/// @nodoc
class _$CustomersStateCopyWithImpl<$Res, $Val extends CustomersState>
    implements $CustomersStateCopyWith<$Res> {
  _$CustomersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
    Object? customer = freezed,
  }) {
    return _then(_value.copyWith(
      customers: null == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomersStateImplCopyWith<$Res>
    implements $CustomersStateCopyWith<$Res> {
  factory _$$CustomersStateImplCopyWith(_$CustomersStateImpl value,
          $Res Function(_$CustomersStateImpl) then) =
      __$$CustomersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Customer> customers, Customer? customer});
}

/// @nodoc
class __$$CustomersStateImplCopyWithImpl<$Res>
    extends _$CustomersStateCopyWithImpl<$Res, _$CustomersStateImpl>
    implements _$$CustomersStateImplCopyWith<$Res> {
  __$$CustomersStateImplCopyWithImpl(
      _$CustomersStateImpl _value, $Res Function(_$CustomersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
    Object? customer = freezed,
  }) {
    return _then(_$CustomersStateImpl(
      customers: null == customers
          ? _value._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ));
  }
}

/// @nodoc

class _$CustomersStateImpl extends _CustomersState
    with DiagnosticableTreeMixin {
  const _$CustomersStateImpl(
      {final List<Customer> customers = const [], this.customer})
      : _customers = customers,
        super._();

  final List<Customer> _customers;
  @override
  @JsonKey()
  List<Customer> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  @override
  final Customer? customer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomersState(customers: $customers, customer: $customer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomersState'))
      ..add(DiagnosticsProperty('customers', customers))
      ..add(DiagnosticsProperty('customer', customer));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomersStateImpl &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers) &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_customers), customer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomersStateImplCopyWith<_$CustomersStateImpl> get copyWith =>
      __$$CustomersStateImplCopyWithImpl<_$CustomersStateImpl>(
          this, _$identity);
}

abstract class _CustomersState extends CustomersState {
  const factory _CustomersState(
      {final List<Customer> customers,
      final Customer? customer}) = _$CustomersStateImpl;
  const _CustomersState._() : super._();

  @override
  List<Customer> get customers;
  @override
  Customer? get customer;
  @override
  @JsonKey(ignore: true)
  _$$CustomersStateImplCopyWith<_$CustomersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PrinterState {
  List<BluetoothDevice> get devices => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrinterStateCopyWith<PrinterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterStateCopyWith<$Res> {
  factory $PrinterStateCopyWith(
          PrinterState value, $Res Function(PrinterState) then) =
      _$PrinterStateCopyWithImpl<$Res, PrinterState>;
  @useResult
  $Res call({List<BluetoothDevice> devices, bool isConnected});
}

/// @nodoc
class _$PrinterStateCopyWithImpl<$Res, $Val extends PrinterState>
    implements $PrinterStateCopyWith<$Res> {
  _$PrinterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrinterStateImplCopyWith<$Res>
    implements $PrinterStateCopyWith<$Res> {
  factory _$$PrinterStateImplCopyWith(
          _$PrinterStateImpl value, $Res Function(_$PrinterStateImpl) then) =
      __$$PrinterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BluetoothDevice> devices, bool isConnected});
}

/// @nodoc
class __$$PrinterStateImplCopyWithImpl<$Res>
    extends _$PrinterStateCopyWithImpl<$Res, _$PrinterStateImpl>
    implements _$$PrinterStateImplCopyWith<$Res> {
  __$$PrinterStateImplCopyWithImpl(
      _$PrinterStateImpl _value, $Res Function(_$PrinterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
    Object? isConnected = null,
  }) {
    return _then(_$PrinterStateImpl(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PrinterStateImpl extends _PrinterState with DiagnosticableTreeMixin {
  const _$PrinterStateImpl(
      {required final List<BluetoothDevice> devices, required this.isConnected})
      : _devices = devices,
        super._();

  final List<BluetoothDevice> _devices;
  @override
  List<BluetoothDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  final bool isConnected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrinterState(devices: $devices, isConnected: $isConnected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrinterState'))
      ..add(DiagnosticsProperty('devices', devices))
      ..add(DiagnosticsProperty('isConnected', isConnected));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterStateImpl &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_devices), isConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterStateImplCopyWith<_$PrinterStateImpl> get copyWith =>
      __$$PrinterStateImplCopyWithImpl<_$PrinterStateImpl>(this, _$identity);
}

abstract class _PrinterState extends PrinterState {
  const factory _PrinterState(
      {required final List<BluetoothDevice> devices,
      required final bool isConnected}) = _$PrinterStateImpl;
  const _PrinterState._() : super._();

  @override
  List<BluetoothDevice> get devices;
  @override
  bool get isConnected;
  @override
  @JsonKey(ignore: true)
  _$$PrinterStateImplCopyWith<_$PrinterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
