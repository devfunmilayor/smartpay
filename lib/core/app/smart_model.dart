// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'smart_model.freezed.dart';
part 'smart_model.g.dart';

@freezed
class SmartPayModel with _$SmartPayModel {
  factory SmartPayModel(
      {bool? status,
      @JsonKey(name: 'message') dynamic responseMessage,
      @JsonKey(name: 'data') dynamic data}) = _SmartPayModel;

  factory SmartPayModel.fromJson(Map<String, dynamic> json) =>
      _$SmartPayModelFromJson(json);
}
