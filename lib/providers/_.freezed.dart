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
  String get customerName => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get customerMobile => throw _privateConstructorUsedError;
  IdType get idType => throw _privateConstructorUsedError;
  PaymentType get paymentType => throw _privateConstructorUsedError;

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
      String customerName,
      String customerId,
      String customerMobile,
      IdType idType,
      PaymentType paymentType});
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
    Object? customerName = null,
    Object? customerId = null,
    Object? customerMobile = null,
    Object? idType = null,
    Object? paymentType = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerMobile: null == customerMobile
          ? _value.customerMobile
          : customerMobile // ignore: cast_nullable_to_non_nullable
              as String,
      idType: null == idType
          ? _value.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as IdType,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
    ) as $Val);
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
      String customerName,
      String customerId,
      String customerMobile,
      IdType idType,
      PaymentType paymentType});
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
    Object? customerName = null,
    Object? customerId = null,
    Object? customerMobile = null,
    Object? idType = null,
    Object? paymentType = null,
  }) {
    return _then(_$NewReceiptStateImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerMobile: null == customerMobile
          ? _value.customerMobile
          : customerMobile // ignore: cast_nullable_to_non_nullable
              as String,
      idType: null == idType
          ? _value.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as IdType,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
    ));
  }
}

/// @nodoc

class _$NewReceiptStateImpl extends _NewReceiptState
    with DiagnosticableTreeMixin {
  const _$NewReceiptStateImpl(
      {this.currentStep = 0,
      this.customerName = '',
      this.customerId = '',
      this.customerMobile = '',
      this.idType = IdType.tin,
      this.paymentType = PaymentType.cash})
      : super._();

  @override
  @JsonKey()
  final int currentStep;
  @override
  @JsonKey()
  final String customerName;
  @override
  @JsonKey()
  final String customerId;
  @override
  @JsonKey()
  final String customerMobile;
  @override
  @JsonKey()
  final IdType idType;
  @override
  @JsonKey()
  final PaymentType paymentType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewReceiptState(currentStep: $currentStep, customerName: $customerName, customerId: $customerId, customerMobile: $customerMobile, idType: $idType, paymentType: $paymentType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NewReceiptState'))
      ..add(DiagnosticsProperty('currentStep', currentStep))
      ..add(DiagnosticsProperty('customerName', customerName))
      ..add(DiagnosticsProperty('customerId', customerId))
      ..add(DiagnosticsProperty('customerMobile', customerMobile))
      ..add(DiagnosticsProperty('idType', idType))
      ..add(DiagnosticsProperty('paymentType', paymentType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewReceiptStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerMobile, customerMobile) ||
                other.customerMobile == customerMobile) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, customerName,
      customerId, customerMobile, idType, paymentType);

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
      final String customerName,
      final String customerId,
      final String customerMobile,
      final IdType idType,
      final PaymentType paymentType}) = _$NewReceiptStateImpl;
  const _NewReceiptState._() : super._();

  @override
  int get currentStep;
  @override
  String get customerName;
  @override
  String get customerId;
  @override
  String get customerMobile;
  @override
  IdType get idType;
  @override
  PaymentType get paymentType;
  @override
  @JsonKey(ignore: true)
  _$$NewReceiptStateImplCopyWith<_$NewReceiptStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
