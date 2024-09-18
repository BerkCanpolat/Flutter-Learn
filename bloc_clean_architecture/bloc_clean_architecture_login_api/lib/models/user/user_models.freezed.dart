// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModels _$UserModelsFromJson(Map<String, dynamic> json) {
  return _UserModels.fromJson(json);
}

/// @nodoc
mixin _$UserModels {
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'error')
  String get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelsCopyWith<UserModels> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelsCopyWith<$Res> {
  factory $UserModelsCopyWith(
          UserModels value, $Res Function(UserModels) then) =
      _$UserModelsCopyWithImpl<$Res, UserModels>;
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'error') String error});
}

/// @nodoc
class _$UserModelsCopyWithImpl<$Res, $Val extends UserModels>
    implements $UserModelsCopyWith<$Res> {
  _$UserModelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelsImplCopyWith<$Res>
    implements $UserModelsCopyWith<$Res> {
  factory _$$UserModelsImplCopyWith(
          _$UserModelsImpl value, $Res Function(_$UserModelsImpl) then) =
      __$$UserModelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'error') String error});
}

/// @nodoc
class __$$UserModelsImplCopyWithImpl<$Res>
    extends _$UserModelsCopyWithImpl<$Res, _$UserModelsImpl>
    implements _$$UserModelsImplCopyWith<$Res> {
  __$$UserModelsImplCopyWithImpl(
      _$UserModelsImpl _value, $Res Function(_$UserModelsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? error = null,
  }) {
    return _then(_$UserModelsImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelsImpl implements _UserModels {
  _$UserModelsImpl(
      {@JsonKey(name: 'token') this.token = '',
      @JsonKey(name: 'error') this.error = ''});

  factory _$UserModelsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelsImplFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String token;
  @override
  @JsonKey(name: 'error')
  final String error;

  @override
  String toString() {
    return 'UserModels(token: $token, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelsImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelsImplCopyWith<_$UserModelsImpl> get copyWith =>
      __$$UserModelsImplCopyWithImpl<_$UserModelsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelsImplToJson(
      this,
    );
  }
}

abstract class _UserModels implements UserModels {
  factory _UserModels(
      {@JsonKey(name: 'token') final String token,
      @JsonKey(name: 'error') final String error}) = _$UserModelsImpl;

  factory _UserModels.fromJson(Map<String, dynamic> json) =
      _$UserModelsImpl.fromJson;

  @override
  @JsonKey(name: 'token')
  String get token;
  @override
  @JsonKey(name: 'error')
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$UserModelsImplCopyWith<_$UserModelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
