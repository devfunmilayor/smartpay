import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/app/smart_pay_state.dart';
import 'package:smart_pay/core/enum/smart_pay_enum.dart';
import 'package:smart_pay/core/mixin/smart_mixin.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/core/shared/smaert_pay_toast.dart';

import 'package:smart_pay/core/shared/smart_pay_app_bar.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';
import 'package:smart_pay/core/shared/smart_pay_divider.dart';
import 'package:smart_pay/core/shared/smart_pay_field.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_event.dart';
import 'package:smart_pay/feautres/auth/presentation/views/login_view.dart';
import 'package:smart_pay/feautres/auth/presentation/views/verification_view.dart';

import 'package:smart_pay/feautres/auth/presentation/widgets/login_widget.dart';
import 'package:smart_pay/gen/assets.gen.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> with SmartPayValidate {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authBloc.select((vaue) => vaue));
    ref.listen(authBloc, (previousState, newState) {
      if (newState.verifyEmailStatus == SmartPayAppState.submissionFailure) {
        ToasResp.errorMessage(newState.exceptionError);
      } else if (newState.verifyEmailStatus ==
          SmartPayAppState.submissionSuccess) {
        RouteConfigKQ.to(page: VerificationView());
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
            RichText(
              text: TextSpan(children: <InlineSpan>[
                TextSpan(
                    text: "Create a ",
                    style:
                        getBoldStyle(color: ColorManager.black, fontSize: 25)),
                TextSpan(
                    text: "Smartpay",
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: 25)),
              ]),
            ),
            Text('account',
                style: getBoldStyle(color: ColorManager.black, fontSize: 25)),
            20.0.h,
            SmartPayField(
                hasTextfieldLabel: false,
                validate: validateEmail,
                hintText: 'Email',
                inputType: TextInputType.emailAddress,
                onChanged: (p0) => ref
                    .read(authBloc.notifier)
                    .mapEventsToState(EmailChangeEvent(emailVal: p0)),
                isLastField: false),
            30.0.h,
            SmartPayButton(
                disable: !authState.emailBool,
                isLoading: authState.verifyEmailStatus ==
                    SmartPayAppState.submissionInProgress,
                text: 'Sign Up',
                onTap: !authState.emailBool
                    ? () {}
                    : () => ref
                        .read(authBloc.notifier)
                        .mapEventsToState(VerifyEmailEvent()),
                color: ColorManager.darkPrimary),
            30.0.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Expanded(child: SmartPayDivider()),
                Text('    OR   ',
                    style: getLightStyle(color: ColorManager.black)),
                const Expanded(child: SmartPayDivider()),
              ],
            ),
            30.0.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBrandButton(
                    Assets.svg.google.svg(), () => print('Google Sign In')),
                buildBrandButton(
                    Assets.svg.apple
                        .svg(height: 20, width: 20, fit: BoxFit.contain),
                    () => print('Google Sign In')),
              ],
            ),
            90.0.h,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <InlineSpan>[
                TextSpan(
                  text: "Already have an account? ",
                  style: getMediumStyle(
                      color: ColorManager.spalshRentalColor, fontSize: 12),
                ),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => RouteConfigKQ.toCloseAll(p: LoginView()),
                    text: 'Sign In',
                    style: getBoldStyle(
                        decoration: TextDecoration.underline,
                        color: ColorManager.primary,
                        fontSize: 12))
              ]),
            ),
          ],
        )));
  }
}
