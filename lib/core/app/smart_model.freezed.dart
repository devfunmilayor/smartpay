// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmartPayModel _$SmartPayModelFromJson(Map<String, dynamic> json) {
  return _SmartPayModel.fromJson(json);
}

/// @nodoc
mixin _$SmartPayModel {
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  dynamic get responseMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartPayModelCopyWith<SmartPayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartPayModelCopyWith<$Res> {
  factory $SmartPayModelCopyWith(
          SmartPayModel value, $Res Function(SmartPayModel) then) =
      _$SmartPayModelCopyWithImpl<$Res, SmartPayModel>;
  @useResult
  $Res call(
      {bool? status,
      @JsonKey(name: 'message') dynamic responseMessage,
      @JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class _$SmartPayModelCopyWithImpl<$Res, $Val extends SmartPayModel>
    implements $SmartPayModelCopyWith<$Res> {
  _$SmartPayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? responseMessage = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmartPayModelImplCopyWith<$Res>
    implements $SmartPayModelCopyWith<$Res> {
  factory _$$SmartPayModelImplCopyWith(
          _$SmartPayModelImpl value, $Res Function(_$SmartPayModelImpl) then) =
      __$$SmartPayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status,
      @JsonKey(name: 'message') dynamic responseMessage,
      @JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class __$$SmartPayModelImplCopyWithImpl<$Res>
    extends _$SmartPayModelCopyWithImpl<$Res, _$SmartPayModelImpl>
    implements _$$SmartPayModelImplCopyWith<$Res> {
  __$$SmartPayModelImplCopyWithImpl(
      _$SmartPayModelImpl _value, $Res Function(_$SmartPayModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? responseMessage = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SmartPayModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmartPayModelImpl implements _SmartPayModel {
  _$SmartPayModelImpl(
      {this.status,
      @JsonKey(name: 'message') this.responseMessage,
      @JsonKey(name: 'data') this.data});

  factory _$SmartPayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmartPayModelImplFromJson(json);

  @override
  final bool? status;
  @override
  @JsonKey(name: 'message')
  final dynamic responseMessage;
  @override
  @JsonKey(name: 'data')
  final dynamic data;

  @override
  String toString() {
    return 'SmartPayModel(status: $status, responseMessage: $responseMessage, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmartPayModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.responseMessage, responseMessage) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(responseMessage),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SmartPayModelImplCopyWith<_$SmartPayModelImpl> get copyWith =>
      __$$SmartPayModelImplCopyWithImpl<_$SmartPayModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmartPayModelImplToJson(
      this,
    );
  }
}

abstract class _SmartPayModel implements SmartPayModel {
  factory _SmartPayModel(
      {final bool? status,
      @JsonKey(name: 'message') final dynamic responseMessage,
      @JsonKey(name: 'data') final dynamic data}) = _$SmartPayModelImpl;

  factory _SmartPayModel.fromJson(Map<String, dynamic> json) =
      _$SmartPayModelImpl.fromJson;

  @override
  bool? get status;
  @override
  @JsonKey(name: 'message')
  dynamic get responseMessage;
  @override
  @JsonKey(name: 'data')
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$SmartPayModelImplCopyWith<_$SmartPayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
