// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_resp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "username") String? userName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "id") String? userId});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? country = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "username") String? userName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "id") String? userId});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? country = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$UserImpl(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "username") this.userName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "country") this.country,
      @JsonKey(name: "id") this.userId});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "username")
  final String? userName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "country")
  final String? country;
  @override
  @JsonKey(name: "id")
  final String? userId;

  @override
  String toString() {
    return 'User(fullName: $fullName, userName: $userName, email: $email, country: $country, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fullName, userName, email, country, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: "full_name") final String? fullName,
      @JsonKey(name: "username") final String? userName,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "country") final String? country,
      @JsonKey(name: "id") final String? userId}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "username")
  String? get userName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "country")
  String? get country;
  @override
  @JsonKey(name: "id")
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRespData _$UserRespDataFromJson(Map<String, dynamic> json) {
  return _UserRespData.fromJson(json);
}

/// @nodoc
mixin _$UserRespData {
  User get user => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRespDataCopyWith<UserRespData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRespDataCopyWith<$Res> {
  factory $UserRespDataCopyWith(
          UserRespData value, $Res Function(UserRespData) then) =
      _$UserRespDataCopyWithImpl<$Res, UserRespData>;
  @useResult
  $Res call({User user, String token});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserRespDataCopyWithImpl<$Res, $Val extends UserRespData>
    implements $UserRespDataCopyWith<$Res> {
  _$UserRespDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserRespDataImplCopyWith<$Res>
    implements $UserRespDataCopyWith<$Res> {
  factory _$$UserRespDataImplCopyWith(
          _$UserRespDataImpl value, $Res Function(_$UserRespDataImpl) then) =
      __$$UserRespDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, String token});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserRespDataImplCopyWithImpl<$Res>
    extends _$UserRespDataCopyWithImpl<$Res, _$UserRespDataImpl>
    implements _$$UserRespDataImplCopyWith<$Res> {
  __$$UserRespDataImplCopyWithImpl(
      _$UserRespDataImpl _value, $Res Function(_$UserRespDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? token = null,
  }) {
    return _then(_$UserRespDataImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRespDataImpl implements _UserRespData {
  _$UserRespDataImpl({required this.user, required this.token});

  factory _$UserRespDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRespDataImplFromJson(json);

  @override
  final User user;
  @override
  final String token;

  @override
  String toString() {
    return 'UserRespData(user: $user, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRespDataImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRespDataImplCopyWith<_$UserRespDataImpl> get copyWith =>
      __$$UserRespDataImplCopyWithImpl<_$UserRespDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRespDataImplToJson(
      this,
    );
  }
}

abstract class _UserRespData implements UserRespData {
  factory _UserRespData(
      {required final User user,
      required final String token}) = _$UserRespDataImpl;

  factory _UserRespData.fromJson(Map<String, dynamic> json) =
      _$UserRespDataImpl.fromJson;

  @override
  User get user;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$UserRespDataImplCopyWith<_$UserRespDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
