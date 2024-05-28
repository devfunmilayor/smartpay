import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';
import 'package:smart_pay/core/app/smart_model.dart';
import 'package:smart_pay/core/app/smart_pay_error.dart';

@factoryMethod
abstract class AuthRepository {
  Future<Either<AppError, SmartPayModel>> login(body);
  Future<Either<AppError, SmartPayModel>> logout();
  Future<Either<AppError, SmartPayModel>> dashboard();

  Future<Either<AppError, SmartPayModel>> signUp(body);
  Future<Either<AppError, SmartPayModel>> verifyEmail(body);
  Future<Either<AppError, SmartPayModel>> verifyOtp(body);
}
