import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_pay/core/app/smart_model.dart';
import 'package:smart_pay/core/app/smart_pay_error.dart';
import 'package:smart_pay/core/usecases/smart_pay_no_params.dart';
import 'package:smart_pay/core/usecases/smart_pay_usecase.dart';
import 'package:smart_pay/feautres/auth/domain/repository/auth_repository.dart';

@lazySingleton
class SignUpUsecase extends UseCase<SmartPayModel, Map> {
  final AuthRepository authRepository;
  SignUpUsecase(@Named("authImpl") this.authRepository);
  @override
  Future<Either<AppError, SmartPayModel>> call(params) async {
    return await authRepository.signUp(params);
  }
}

@lazySingleton
class LoginUsecase extends UseCase<SmartPayModel, Map> {
  final AuthRepository authRepository;
  LoginUsecase(@Named("authImpl") this.authRepository);
  @override
  Future<Either<AppError, SmartPayModel>> call(params) async {
    return await authRepository.login(params);
  }
}

@lazySingleton
class LogoutUsecase extends UseCase<SmartPayModel, NoParams> {
  final AuthRepository authRepository;
  LogoutUsecase(@Named("authImpl") this.authRepository);
  @override
  Future<Either<AppError, SmartPayModel>> call(params) async {
    return await authRepository.logout();
  }
}

@lazySingleton
class VerifyOtplUsecase extends UseCase<SmartPayModel, Map> {
  final AuthRepository authRepository;
  VerifyOtplUsecase(@Named("authImpl") this.authRepository);
  @override
  Future<Either<AppError, SmartPayModel>> call(params) async {
    return await authRepository.verifyOtp(params);
  }
}

@lazySingleton
class VerifyEmaiilUsecase extends UseCase<SmartPayModel, Map> {
  final AuthRepository authRepository;
  VerifyEmaiilUsecase(@Named("authImpl") this.authRepository);
  @override
  Future<Either<AppError, SmartPayModel>> call(params) async {
    return await authRepository.verifyEmail(params);
  }
}

@lazySingleton
class GetDashBoardUsecase extends UseCase<SmartPayModel, NoParams> {
  final AuthRepository authRepository;
  GetDashBoardUsecase(@Named("authImpl") this.authRepository);
  @override
  Future<Either<AppError, SmartPayModel>> call(params) async {
    return await authRepository.dashboard();
  }
}
