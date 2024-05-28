import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_pay/core/app/smart_model.dart';
import 'package:smart_pay/core/app/smart_pay_error.dart';
import 'package:smart_pay/core/network/exception.dart';
import 'package:smart_pay/feautres/auth/data/datasource/auth_source.dart';
import 'package:smart_pay/feautres/auth/domain/repository/auth_repository.dart';

@Named("authImpl")
@Injectable(as: AuthRepository)
class AuthImpl extends AuthRepository {
  final AuthService authService;

  AuthImpl(
    @Named("authSource") this.authService,
  );

  @override
  Future<Either<AppError, SmartPayModel>> login(body) async {
    try {
      final dataResp = await authService.login(body);

      log('dataResp:: $dataResp');
      return Right(dataResp);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(AppError(errorMessage));
    }
  }

  @override
  Future<Either<AppError, SmartPayModel>> logout() async {
    try {
      final dataResp = await authService.logout();

      log('dataResp:: $dataResp');
      return Right(dataResp);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(AppError(errorMessage));
    }
  }

  @override
  Future<Either<AppError, SmartPayModel>> signUp(body) async {
    try {
      final dataResp = await authService.signUp(body);

      log('dataResp:: $dataResp');
      return Right(dataResp);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(AppError(errorMessage));
    }
  }

  @override
  Future<Either<AppError, SmartPayModel>> verifyEmail(body) async {
    try {
      final dataResp = await authService.verifyEmail(body);

      log('dataResp:: $dataResp');
      return Right(dataResp);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(AppError(errorMessage));
    }
  }

  @override
  Future<Either<AppError, SmartPayModel>> verifyOtp(body) async {
    try {
      final dataResp = await authService.verifyOtp(body);

      log('dataResp:: $dataResp');
      return Right(dataResp);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(AppError(errorMessage));
    }
  }

  @override
  Future<Either<AppError, SmartPayModel>> dashboard() async {
    try {
      final dataResp = await authService.dashboard();

      log('dataResp:: $dataResp');
      return Right(dataResp);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(AppError(errorMessage));
    }
  }
}
