import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:smart_pay/core/app/smart_pay_error.dart';

@prod
@test
@dev
@factoryMethod
abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(
    Params params,
  );
}

abstract class UseCaseQuery<Type, Params> {
  Future<Either<AppError, Type>> call(Params params, id);
}
