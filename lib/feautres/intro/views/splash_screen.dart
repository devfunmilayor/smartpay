import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/feautres/intro/views/intro.dart';
import 'package:smart_pay/gen/assets.gen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late Timer timer;
  bool hasCompleteSplash = false;
  splashTimer() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, autoNavigate);
  }

  autoNavigate() {
    // var k = ref.read(authBloc.notifier).setUserclickGetStarted(
    //     sharedPrefUtils.getBool(key: PrefKeys.USER_GETSTARTED));

    // if (k == true) {
    //   timer = Timer(const Duration(seconds: 3),
    //       () => RouteConfigKQ.toReplacement(page: LoginView()));
    // } else {

    timer = Timer(const Duration(seconds: 3),
        () => RouteConfigKQ.toReplacement(page: IntroWidget()));
    // }
  }

  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Assets.svg.smartPayLogo.svg(),
    ));
  }
}
