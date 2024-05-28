import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/core/di/injector.dart';
import 'package:smart_pay/core/resources/theme.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_bloc.dart';
import 'package:smart_pay/feautres/intro/views/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class SmartPayApp extends StatefulWidget {
  const SmartPayApp({super.key});

  @override
  State<SmartPayApp> createState() => _SmartPayAppState();
}

class _SmartPayAppState extends State<SmartPayApp> {
  late AuthBloc authBloc;
  @override
  void initState() {
    authBloc = si<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: scaffoldMessengerKey,
            initialRoute: '/',
            routes: {'/': (context) => SplashScreen()},
            title: 'Rebake',
            theme: getApplicationTheme(),
            home: child));
  }
}
