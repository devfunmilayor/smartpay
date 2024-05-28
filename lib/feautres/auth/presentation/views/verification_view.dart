import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/app/smart_pay_state.dart';
import 'package:smart_pay/core/enum/smart_pay_enum.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/core/shared/smaert_pay_toast.dart';
import 'package:smart_pay/core/shared/smart_pay_app_bar.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';
import 'package:smart_pay/core/shared/smart_pay_keyboard.dart';

import 'package:smart_pay/core/shared/smart_pay_pin_put.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/core/util/screen_extn.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_event.dart';
import 'package:smart_pay/feautres/auth/presentation/views/sign_up_details.dart';

import 'package:smart_pay/feautres/auth/presentation/widgets/login_widget.dart';

class VerificationView extends ConsumerStatefulWidget {
  const VerificationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationViewState();
}

class _VerificationViewState extends ConsumerState<VerificationView> {
  VerificationAndPinController verificationCtrl =
      VerificationAndPinController();
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authBloc.select((vaue) => vaue));
    ref.listen(authBloc, (previousState, newState) {
      if (newState.verifyOtpStatus == SmartPayAppState.submissionFailure) {
        ToasResp.errorMessage(newState.exceptionError);
      } else if (newState.verifyOtpStatus ==
          SmartPayAppState.submissionSuccess) {
        RouteConfigKQ.to(page: SignUpDetailsView());
      }
    });

    return Scaffold(
        appBar: AppBarWithBack(),
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
              buildWidgetForHeaderDesc(
                  label: 'Verify its you',
                  text1:
                      'We send a code to (*****@gmail.com). Enter it here to verify your identity.'),
              20.0.h,
              buildOTPPinPut(
                verificationCtrl: verificationCtrl,
                oncomplete: (p0) {
                  ref
                      .read(authBloc.notifier)
                      .mapEventsToState(VerifyOtpEvent());
                  return null;
                },
                length: 5,
                onChanged: (p0) => ref
                    .read(authBloc.notifier)
                    .mapEventsToState(OtpValidationEvent(valOtp: p0)),
              ),
              20.0.h,
              Center(
                child: Text('Resend code in 30 secs',
                    style: getBoldStyle(
                        color: ColorManager.black.withOpacity(0.5))),
              ),
              SizedBox(height: context.screenHeight(0.06)),
              SmartPayButton(
                isLoading: authState.verifyOtpStatus ==
                    SmartPayAppState.submissionInProgress,
                disable: !authState.verificationBool,
                onTap: () => ref
                    .read(authBloc.notifier)
                    .mapEventsToState(VerifyOtpEvent()),
                text: 'Confirm',
                color: ColorManager.darkPrimary,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: keypad(verificationCtrl),
              ),
            ])));
  }
}
