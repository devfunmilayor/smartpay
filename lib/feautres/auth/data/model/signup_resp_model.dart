// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_resp_model.freezed.dart';
part 'signup_resp_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "username") String? userName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "id") String? userId,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserRespData with _$UserRespData {
  factory UserRespData({
    required User user,
    required String token,
  }) = _UserRespData;

  factory UserRespData.fromJson(Map<String, dynamic> json) =>
      _$UserRespDataFromJson(json);
}
