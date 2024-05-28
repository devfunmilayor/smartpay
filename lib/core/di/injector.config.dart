// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feautres/auth/data/datasource/auth_source.dart' as _i4;
import '../../feautres/auth/data/datasource/authsource_impl.dart' as _i5;
import '../../feautres/auth/domain/repository/auth_repository.dart' as _i7;
import '../../feautres/auth/domain/repository/auth_repository_impl.dart' as _i8;
import '../../feautres/auth/domain/usecase/auth_usecase.dart' as _i9;
import '../../feautres/auth/presentation/bloc/auth_bloc.dart' as _i10;
import '../db/preference_store.dart' as _i6;
import '../network/api.dart' as _i3;

const String _prod = 'prod';
const String _test = 'test';
const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.Api>(() => _i3.Api());
    gh.factory<_i4.AuthService>(
      () => _i5.AuthSource(api: gh<_i3.Api>()),
      instanceName: 'authSource',
    );
    gh.lazySingleton<_i6.SharedPrefUtils>(
      () => _i6.SharedPrefUtils(),
      registerFor: {
        _prod,
        _test,
        _dev,
      },
    );
    gh.factory<_i7.AuthRepository>(
      () => _i8.AuthImpl(gh<_i4.AuthService>(instanceName: 'authSource')),
      instanceName: 'authImpl',
    );
    gh.lazySingleton<_i9.SignUpUsecase>(() =>
        _i9.SignUpUsecase(gh<_i7.AuthRepository>(instanceName: 'authImpl')));
    gh.lazySingleton<_i9.LoginUsecase>(() =>
        _i9.LoginUsecase(gh<_i7.AuthRepository>(instanceName: 'authImpl')));
    gh.lazySingleton<_i9.LogoutUsecase>(() =>
        _i9.LogoutUsecase(gh<_i7.AuthRepository>(instanceName: 'authImpl')));
    gh.lazySingleton<_i9.VerifyOtplUsecase>(() => _i9.VerifyOtplUsecase(
        gh<_i7.AuthRepository>(instanceName: 'authImpl')));
    gh.lazySingleton<_i9.VerifyEmaiilUsecase>(() => _i9.VerifyEmaiilUsecase(
        gh<_i7.AuthRepository>(instanceName: 'authImpl')));
    gh.lazySingleton<_i9.GetDashBoardUsecase>(() => _i9.GetDashBoardUsecase(
        gh<_i7.AuthRepository>(instanceName: 'authImpl')));
    gh.lazySingleton<_i10.AuthBloc>(() => _i10.AuthBloc(
          gh<_i9.SignUpUsecase>(),
          gh<_i9.LoginUsecase>(),
          gh<_i9.VerifyOtplUsecase>(),
          gh<_i9.VerifyEmaiilUsecase>(),
          gh<_i9.LogoutUsecase>(),
          gh<_i9.GetDashBoardUsecase>(),
        ));
    return this;
  }
}
