// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_pay/core/app/smart_model.dart';
import 'package:smart_pay/core/db/preference_store.dart';
import 'package:smart_pay/core/keys/endpoints.dart';
import 'package:smart_pay/core/keys/pref_keys.dart';
import 'package:smart_pay/core/network/api.dart';
import 'package:smart_pay/feautres/auth/data/datasource/auth_source.dart';

@Named("authSource")
@Injectable(as: AuthService)
class AuthSource extends AuthService {
  final Api api;
  AuthSource({required this.api});

  @override
  Future<SmartPayModel> login(body) async {
    try {
      Response response = await api.post(onboarding.login, data: body);
      return SmartPayModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SmartPayModel> logout() async {
    try {
      Response response = await api.post(
        onboarding.logout,
      );
      return SmartPayModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SmartPayModel> signUp(body) async {
    try {
      Response response = await api.post(onboarding.signup, data: body);
      return SmartPayModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SmartPayModel> verifyOtp(body) async {
    try {
      Response response = await api.post(onboarding.verifyEmail, data: body);
      return SmartPayModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SmartPayModel> verifyEmail(body) async {
    try {
      Response response = await api.post(onboarding.getToken, data: body);
      return SmartPayModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SmartPayModel> dashboard() async {
    try {
      Response response = await api.get(
        onboarding.home,
        options: Options(
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                sharedPrefUtils.getString(key: PrefKeys.AUTH_TOKEN),
            'Cookie':
                'jwt=${sharedPrefUtils.getString(key: PrefKeys.AUTH_TOKEN)}',
          },
        ),
        data: {"token": ""},
      );
      return SmartPayModel.fromJson(response.data);
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}
