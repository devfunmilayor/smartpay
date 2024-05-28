import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/core/shared/smart_pay_app_bar.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';
import 'package:smart_pay/core/shared/smart_pay_keyboard.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/feautres/auth/presentation/widgets/login_widget.dart';
import 'package:smart_pay/feautres/auth/presentation/widgets/set_pin_widget.dart';
import 'package:smart_pay/feautres/intro/views/confirmation_view.dart';

class SetPinCodeView extends StatefulWidget {
  const SetPinCodeView({
    super.key,
    this.goHome = false,
    this.goBack = false,
    this.desc,
    this.title,
    this.successMsg,
    this.successTitle,
    this.loading = false,
  });
  final bool loading;
  final bool goHome;
  final bool goBack;

  final String? title;
  final String? desc;
  final String? successMsg;
  final String? successTitle;

  @override
  State<SetPinCodeView> createState() => _SetPinCodeViewState();
}

class _SetPinCodeViewState extends State<SetPinCodeView>
    with TickerProviderStateMixin {
  String pin = '';
  bool loading = false;

  String get currentValue => pin;

  late final AnimationController pinAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  VerificationAndPinController verificationCtrl =
      VerificationAndPinController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext ctx, WidgetRef ref, _) {
        return PopScope(
          canPop: loading == false,
          onPopInvoked: (bool value) {},
          child: Scaffold(
            appBar: AppBarWithBack(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: <Widget>[
                      buildWidgetForHeaderDesc(
                          label: 'Set your pin code',
                          text1:
                              'We use state-of-the-art security measures to protect your information at all times'),
                      20.0.h,
                      AnimatedBuilder(
                        animation: pinAnimationController,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SmartPinBox(
                                value: currentValue.isNotEmpty ? '●' : ''),
                            10.0.w,
                            SmartPinBox(
                                value: currentValue.isNotEmpty &&
                                        currentValue.length > 1
                                    ? '●'
                                    : ''),
                            10.0.w,
                            SmartPinBox(
                                value: currentValue.isNotEmpty &&
                                        currentValue.length > 2
                                    ? '●'
                                    : ''),
                            10.0.w,
                            SmartPinBox(
                                value: currentValue.isNotEmpty &&
                                        currentValue.length > 3
                                    ? '●'
                                    : ''),
                            10.0.w,
                            SmartPinBox(
                                value: currentValue.isNotEmpty &&
                                        currentValue.length > 4
                                    ? '●'
                                    : ''),
                          ],
                        ),
                        builder: (BuildContext context, Widget? child) {
                          final double sineValue = sin(
                            2 * 2 * pi * pinAnimationController.value,
                          );
                          return Transform.translate(
                            offset: Offset(sineValue * 20, 0),
                            child: child,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SmartPayButton(
                    disable: currentValue.length < 5,
                    onTap: () async {
                      if (currentValue.length < 5) {
                        pinAnimationController.forward();
                        return;
                      }

                      // validate();

                      RouteConfigKQ.toReplacement(page: ConfirmationView());
                    },
                    text: 'Continue',
                    color: ColorManager.darkPrimary,
                  ),
                ),
                20.0.h,
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20),
                  child: keypad(verificationCtrl),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
