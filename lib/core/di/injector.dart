import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_pay/core/di/injector.config.dart';

final si = GetIt.instance;
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void smartPayDependencies() => si.init();
