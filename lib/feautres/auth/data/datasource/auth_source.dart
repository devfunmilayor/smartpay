import 'package:injectable/injectable.dart';

import 'package:smart_pay/core/app/smart_model.dart';

@factoryMethod
abstract class AuthService {
  Future<SmartPayModel> login(body);

  Future<SmartPayModel> signUp(body);
  Future<SmartPayModel> logout();
  Future<SmartPayModel> verifyEmail(body);
  Future<SmartPayModel> verifyOtp(body);
  Future<SmartPayModel> dashboard();
}
