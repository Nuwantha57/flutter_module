// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )
    configLoaded,
    required TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )
    sessionCreated,
    required TResult Function() processing,
    required TResult Function(String resultCode, String? pspReference) success,
    required TResult Function(String reason) failed,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult? Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult? Function()? processing,
    TResult? Function(String resultCode, String? pspReference)? success,
    TResult? Function(String reason)? failed,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult Function()? processing,
    TResult Function(String resultCode, String? pspReference)? success,
    TResult Function(String reason)? failed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ConfigLoaded value) configLoaded,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ConfigLoaded value)? configLoaded,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ConfigLoaded value)? configLoaded,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
    PaymentState value,
    $Res Function(PaymentState) then,
  ) = _$PaymentStateCopyWithImpl<$Res, PaymentState>;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PaymentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )
    configLoaded,
    required TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )
    sessionCreated,
    required TResult Function() processing,
    required TResult Function(String resultCode, String? pspReference) success,
    required TResult Function(String reason) failed,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult? Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult? Function()? processing,
    TResult? Function(String resultCode, String? pspReference)? success,
    TResult? Function(String reason)? failed,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult Function()? processing,
    TResult Function(String resultCode, String? pspReference)? success,
    TResult Function(String reason)? failed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ConfigLoaded value) configLoaded,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ConfigLoaded value)? configLoaded,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ConfigLoaded value)? configLoaded,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PaymentState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PaymentState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )
    configLoaded,
    required TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )
    sessionCreated,
    required TResult Function() processing,
    required TResult Function(String resultCode, String? pspReference) success,
    required TResult Function(String reason) failed,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult? Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult? Function()? processing,
    TResult? Function(String resultCode, String? pspReference)? success,
    TResult? Function(String reason)? failed,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult Function()? processing,
    TResult Function(String resultCode, String? pspReference)? success,
    TResult Function(String reason)? failed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ConfigLoaded value) configLoaded,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ConfigLoaded value)? configLoaded,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ConfigLoaded value)? configLoaded,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PaymentState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ConfigLoadedImplCopyWith<$Res> {
  factory _$$ConfigLoadedImplCopyWith(
    _$ConfigLoadedImpl value,
    $Res Function(_$ConfigLoadedImpl) then,
  ) = __$$ConfigLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String clientKey, String environment, String merchantAccount});
}

/// @nodoc
class __$$ConfigLoadedImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$ConfigLoadedImpl>
    implements _$$ConfigLoadedImplCopyWith<$Res> {
  __$$ConfigLoadedImplCopyWithImpl(
    _$ConfigLoadedImpl _value,
    $Res Function(_$ConfigLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientKey = null,
    Object? environment = null,
    Object? merchantAccount = null,
  }) {
    return _then(
      _$ConfigLoadedImpl(
        clientKey: null == clientKey
            ? _value.clientKey
            : clientKey // ignore: cast_nullable_to_non_nullable
                  as String,
        environment: null == environment
            ? _value.environment
            : environment // ignore: cast_nullable_to_non_nullable
                  as String,
        merchantAccount: null == merchantAccount
            ? _value.merchantAccount
            : merchantAccount // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ConfigLoadedImpl implements _ConfigLoaded {
  const _$ConfigLoadedImpl({
    required this.clientKey,
    required this.environment,
    required this.merchantAccount,
  });

  @override
  final String clientKey;
  @override
  final String environment;
  @override
  final String merchantAccount;

  @override
  String toString() {
    return 'PaymentState.configLoaded(clientKey: $clientKey, environment: $environment, merchantAccount: $merchantAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigLoadedImpl &&
            (identical(other.clientKey, clientKey) ||
                other.clientKey == clientKey) &&
            (identical(other.environment, environment) ||
                other.environment == environment) &&
            (identical(other.merchantAccount, merchantAccount) ||
                other.merchantAccount == merchantAccount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, clientKey, environment, merchantAccount);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigLoadedImplCopyWith<_$ConfigLoadedImpl> get copyWith =>
      __$$ConfigLoadedImplCopyWithImpl<_$ConfigLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )
    configLoaded,
    required TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )
    sessionCreated,
    required TResult Function() processing,
    required TResult Function(String resultCode, String? pspReference) success,
    required TResult Function(String reason) failed,
    required TResult Function(String message) error,
  }) {
    return configLoaded(clientKey, environment, merchantAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult? Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult? Function()? processing,
    TResult? Function(String resultCode, String? pspReference)? success,
    TResult? Function(String reason)? failed,
    TResult? Function(String message)? error,
  }) {
    return configLoaded?.call(clientKey, environment, merchantAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult Function()? processing,
    TResult Function(String resultCode, String? pspReference)? success,
    TResult Function(String reason)? failed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (configLoaded != null) {
      return configLoaded(clientKey, environment, merchantAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ConfigLoaded value) configLoaded,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Error value) error,
  }) {
    return configLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ConfigLoaded value)? configLoaded,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Error value)? error,
  }) {
    return configLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ConfigLoaded value)? configLoaded,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (configLoaded != null) {
      return configLoaded(this);
    }
    return orElse();
  }
}

abstract class _ConfigLoaded implements PaymentState {
  const factory _ConfigLoaded({
    required final String clientKey,
    required final String environment,
    required final String merchantAccount,
  }) = _$ConfigLoadedImpl;

  String get clientKey;
  String get environment;
  String get merchantAccount;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigLoadedImplCopyWith<_$ConfigLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionCreatedImplCopyWith<$Res> {
  factory _$$SessionCreatedImplCopyWith(
    _$SessionCreatedImpl value,
    $Res Function(_$SessionCreatedImpl) then,
  ) = __$$SessionCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String sessionId,
    String sessionData,
    String clientKey,
    String environment,
  });
}

/// @nodoc
class __$$SessionCreatedImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$SessionCreatedImpl>
    implements _$$SessionCreatedImplCopyWith<$Res> {
  __$$SessionCreatedImplCopyWithImpl(
    _$SessionCreatedImpl _value,
    $Res Function(_$SessionCreatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? sessionData = null,
    Object? clientKey = null,
    Object? environment = null,
  }) {
    return _then(
      _$SessionCreatedImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionData: null == sessionData
            ? _value.sessionData
            : sessionData // ignore: cast_nullable_to_non_nullable
                  as String,
        clientKey: null == clientKey
            ? _value.clientKey
            : clientKey // ignore: cast_nullable_to_non_nullable
                  as String,
        environment: null == environment
            ? _value.environment
            : environment // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SessionCreatedImpl implements _SessionCreated {
  const _$SessionCreatedImpl({
    required this.sessionId,
    required this.sessionData,
    required this.clientKey,
    required this.environment,
  });

  @override
  final String sessionId;
  @override
  final String sessionData;
  @override
  final String clientKey;
  @override
  final String environment;

  @override
  String toString() {
    return 'PaymentState.sessionCreated(sessionId: $sessionId, sessionData: $sessionData, clientKey: $clientKey, environment: $environment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionCreatedImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.sessionData, sessionData) ||
                other.sessionData == sessionData) &&
            (identical(other.clientKey, clientKey) ||
                other.clientKey == clientKey) &&
            (identical(other.environment, environment) ||
                other.environment == environment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionId, sessionData, clientKey, environment);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionCreatedImplCopyWith<_$SessionCreatedImpl> get copyWith =>
      __$$SessionCreatedImplCopyWithImpl<_$SessionCreatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )
    configLoaded,
    required TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )
    sessionCreated,
    required TResult Function() processing,
    required TResult Function(String resultCode, String? pspReference) success,
    required TResult Function(String reason) failed,
    required TResult Function(String message) error,
  }) {
    return sessionCreated(sessionId, sessionData, clientKey, environment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult? Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult? Function()? processing,
    TResult? Function(String resultCode, String? pspReference)? success,
    TResult? Function(String reason)? failed,
    TResult? Function(String message)? error,
  }) {
    return sessionCreated?.call(sessionId, sessionData, clientKey, environment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult Function()? processing,
    TResult Function(String resultCode, String? pspReference)? success,
    TResult Function(String reason)? failed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (sessionCreated != null) {
      return sessionCreated(sessionId, sessionData, clientKey, environment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ConfigLoaded value) configLoaded,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Error value) error,
  }) {
    return sessionCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ConfigLoaded value)? configLoaded,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Error value)? error,
  }) {
    return sessionCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ConfigLoaded value)? configLoaded,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (sessionCreated != null) {
      return sessionCreated(this);
    }
    return orElse();
  }
}

abstract class _SessionCreated implements PaymentState {
  const factory _SessionCreated({
    required final String sessionId,
    required final String sessionData,
    required final String clientKey,
    required final String environment,
  }) = _$SessionCreatedImpl;

  String get sessionId;
  String get sessionData;
  String get clientKey;
  String get environment;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionCreatedImplCopyWith<_$SessionCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessingImplCopyWith<$Res> {
  factory _$$ProcessingImplCopyWith(
    _$ProcessingImpl value,
    $Res Function(_$ProcessingImpl) then,
  ) = __$$ProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessingImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$ProcessingImpl>
    implements _$$ProcessingImplCopyWith<$Res> {
  __$$ProcessingImplCopyWithImpl(
    _$ProcessingImpl _value,
    $Res Function(_$ProcessingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessingImpl implements _Processing {
  const _$ProcessingImpl();

  @override
  String toString() {
    return 'PaymentState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )
    configLoaded,
    required TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )
    sessionCreated,
    required TResult Function() processing,
    required TResult Function(String resultCode, String? pspReference) success,
    required TResult Function(String reason) failed,
    required TResult Function(String message) error,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult? Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult? Function()? processing,
    TResult? Function(String resultCode, String? pspReference)? success,
    TResult? Function(String reason)? failed,
    TResult? Function(String message)? error,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult Function()? processing,
    TResult Function(String resultCode, String? pspReference)? success,
    TResult Function(String reason)? failed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ConfigLoaded value) configLoaded,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Error value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ConfigLoaded value)? configLoaded,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Error value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ConfigLoaded value)? configLoaded,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements PaymentState {
  const factory _Processing() = _$ProcessingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String resultCode, String? pspReference});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? resultCode = null, Object? pspReference = freezed}) {
    return _then(
      _$SuccessImpl(
        resultCode: null == resultCode
            ? _value.resultCode
            : resultCode // ignore: cast_nullable_to_non_nullable
                  as String,
        pspReference: freezed == pspReference
            ? _value.pspReference
            : pspReference // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.resultCode, this.pspReference});

  @override
  final String resultCode;
  @override
  final String? pspReference;

  @override
  String toString() {
    return 'PaymentState.success(resultCode: $resultCode, pspReference: $pspReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.pspReference, pspReference) ||
                other.pspReference == pspReference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resultCode, pspReference);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )
    configLoaded,
    required TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )
    sessionCreated,
    required TResult Function() processing,
    required TResult Function(String resultCode, String? pspReference) success,
    required TResult Function(String reason) failed,
    required TResult Function(String message) error,
  }) {
    return success(resultCode, pspReference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult? Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult? Function()? processing,
    TResult? Function(String resultCode, String? pspReference)? success,
    TResult? Function(String reason)? failed,
    TResult? Function(String message)? error,
  }) {
    return success?.call(resultCode, pspReference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult Function()? processing,
    TResult Function(String resultCode, String? pspReference)? success,
    TResult Function(String reason)? failed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(resultCode, pspReference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ConfigLoaded value) configLoaded,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ConfigLoaded value)? configLoaded,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ConfigLoaded value)? configLoaded,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements PaymentState {
  const factory _Success({
    required final String resultCode,
    final String? pspReference,
  }) = _$SuccessImpl;

  String get resultCode;
  String? get pspReference;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
    _$FailedImpl value,
    $Res Function(_$FailedImpl) then,
  ) = __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
    _$FailedImpl _value,
    $Res Function(_$FailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = null}) {
    return _then(
      _$FailedImpl(
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl({required this.reason});

  @override
  final String reason;

  @override
  String toString() {
    return 'PaymentState.failed(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )
    configLoaded,
    required TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )
    sessionCreated,
    required TResult Function() processing,
    required TResult Function(String resultCode, String? pspReference) success,
    required TResult Function(String reason) failed,
    required TResult Function(String message) error,
  }) {
    return failed(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult? Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult? Function()? processing,
    TResult? Function(String resultCode, String? pspReference)? success,
    TResult? Function(String reason)? failed,
    TResult? Function(String message)? error,
  }) {
    return failed?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult Function()? processing,
    TResult Function(String resultCode, String? pspReference)? success,
    TResult Function(String reason)? failed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ConfigLoaded value) configLoaded,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Error value) error,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ConfigLoaded value)? configLoaded,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Error value)? error,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ConfigLoaded value)? configLoaded,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements PaymentState {
  const factory _Failed({required final String reason}) = _$FailedImpl;

  String get reason;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'PaymentState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )
    configLoaded,
    required TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )
    sessionCreated,
    required TResult Function() processing,
    required TResult Function(String resultCode, String? pspReference) success,
    required TResult Function(String reason) failed,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult? Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult? Function()? processing,
    TResult? Function(String resultCode, String? pspReference)? success,
    TResult? Function(String reason)? failed,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String clientKey,
      String environment,
      String merchantAccount,
    )?
    configLoaded,
    TResult Function(
      String sessionId,
      String sessionData,
      String clientKey,
      String environment,
    )?
    sessionCreated,
    TResult Function()? processing,
    TResult Function(String resultCode, String? pspReference)? success,
    TResult Function(String reason)? failed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ConfigLoaded value) configLoaded,
    required TResult Function(_SessionCreated value) sessionCreated,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ConfigLoaded value)? configLoaded,
    TResult? Function(_SessionCreated value)? sessionCreated,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ConfigLoaded value)? configLoaded,
    TResult Function(_SessionCreated value)? sessionCreated,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PaymentState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
