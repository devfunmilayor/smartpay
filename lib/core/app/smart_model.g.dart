// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmartPayModelImpl _$$SmartPayModelImplFromJson(Map<String, dynamic> json) =>
    _$SmartPayModelImpl(
      status: json['status'] as bool?,
      responseMessage: json['message'],
      data: json['data'],
    );

Map<String, dynamic> _$$SmartPayModelImplToJson(_$SmartPayModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.responseMessage,
      'data': instance.data,
    };
