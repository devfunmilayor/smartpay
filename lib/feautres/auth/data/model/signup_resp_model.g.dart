// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      fullName: json['full_name'] as String?,
      userName: json['username'] as String?,
      email: json['email'] as String?,
      country: json['country'] as String?,
      userId: json['id'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'username': instance.userName,
      'email': instance.email,
      'country': instance.country,
      'id': instance.userId,
    };

_$UserRespDataImpl _$$UserRespDataImplFromJson(Map<String, dynamic> json) =>
    _$UserRespDataImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$$UserRespDataImplToJson(_$UserRespDataImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
