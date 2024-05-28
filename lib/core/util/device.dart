import 'dart:io';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:smart_pay/feautres/auth/data/model/device.dart';

Future<DeviceInfoModel> getCompleteDeviceInfo() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String devicePlatform = 'Android';
  String? deviceName;
  String? deviceOs;
  String? ipAddress;

  if (Platform.isIOS) {
    devicePlatform = 'iOS';
  }

  try {} catch (e) {
    //
  }

  if (Platform.isAndroid) {
    try {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName =
          '${androidInfo.model} ${androidInfo.id} ${androidInfo.brand}';
    } catch (e) {
      ///
    }
  }

  if (Platform.isIOS) {
    try {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = '${iosInfo.name} ${iosInfo.systemVersion}';
    } catch (e) {
      ///
    }
  }

  try {
    ipAddress = await Ipify.ipv4();
  } catch (e) {
    //
  }

  return DeviceInfoModel(
    devicePlatform: devicePlatform,
    deviceName: deviceName?.replaceAll(RegExp('[^a-zA-Z0-9\\s]'), ''),
    deviceOs: deviceOs ?? 'Mobile',
    ipAddress: ipAddress,
  );
}
