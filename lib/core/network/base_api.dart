import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class BaseApi {
  dynamic get apiUrl {
    if (kReleaseMode) {
      return dotenv.env['PRODUCTION_URL'] ?? '';
    } else {
      return dotenv.env['STAGING_URL'] ?? '';
    }
  }
}
