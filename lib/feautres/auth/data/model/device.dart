// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeviceInfoModel {
  String? deviceId;
  String? deviceName;
  String? ipAddress;
  String? deviceOs;
  String? devicePlatform;
  DeviceInfoModel(
      {this.deviceId,
      this.deviceName,
      this.ipAddress,
      this.deviceOs,
      this.devicePlatform});

  DeviceInfoModel copyWith({
    String? deviceId,
    String? deviceName,
    String? ipAddress,
    String? deviceOs,
    String? devicePlatform,
  }) {
    return DeviceInfoModel(
      deviceId: deviceId ?? this.deviceId,
      deviceName: deviceName ?? this.deviceName,
      ipAddress: ipAddress ?? this.ipAddress,
      deviceOs: deviceOs ?? this.deviceOs,
      devicePlatform: devicePlatform ?? this.devicePlatform,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deviceId': deviceId,
      'deviceName': deviceName,
      'ipAddress': ipAddress,
      'deviceOs': deviceOs,
      'devicePlatform': devicePlatform,
    };
  }

  factory DeviceInfoModel.fromMap(Map<String, dynamic> map) {
    return DeviceInfoModel(
      deviceId: map['deviceId'] != null ? map['deviceId'] as String : null,
      deviceName:
          map['deviceName'] != null ? map['deviceName'] as String : null,
      ipAddress: map['ipAddress'] != null ? map['ipAddress'] as String : null,
      deviceOs: map['deviceOs'] != null ? map['deviceOs'] as String : null,
      devicePlatform: map['devicePlatform'] != null
          ? map['devicePlatform'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceInfoModel.fromJson(String source) =>
      DeviceInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DeviceInfoModel(deviceId: $deviceId, deviceName: $deviceName, ipAddress: $ipAddress, deviceOs: $deviceOs, devicePlatform: $devicePlatform)';
  }

  @override
  bool operator ==(covariant DeviceInfoModel other) {
    if (identical(this, other)) {
      return true;
    }

    return other.deviceId == deviceId &&
        other.deviceName == deviceName &&
        other.ipAddress == ipAddress &&
        other.deviceOs == deviceOs &&
        other.devicePlatform == devicePlatform;
  }

  @override
  int get hashCode {
    return deviceId.hashCode ^
        deviceName.hashCode ^
        ipAddress.hashCode ^
        deviceOs.hashCode ^
        devicePlatform.hashCode;
  }
}
