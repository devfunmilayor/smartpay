import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/app/smart_pay.dart.dart';
import 'package:smart_pay/core/di/injector.dart';

const iOSLocalizedLabels = false;
@pragma('vm:entry-point')
void main() async {
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  smartPayDependencies();

  await dotenv.load(fileName: '.env');
  runApp(ProviderScope(child: SmartPayApp()));
}
