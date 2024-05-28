import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
import 'package:smart_pay/feautres/auth/presentation/views/forgot_password_view.dart';
import 'package:smart_pay/feautres/auth/presentation/views/sign_up_view.dart';
import 'package:smart_pay/feautres/auth/presentation/widgets/login_widget.dart';
import 'package:smart_pay/feautres/intro/views/dashboard_view.dart';
import 'package:smart_pay/gen/assets.gen.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with SmartPayValidate {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(authBloc.notifier).cleanFieldText();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authBloc.select((vaue) => vaue));
    ref.listen(authBloc, (previousState, newState) {
      if (newState.loginStatus == SmartPayAppState.submissionFailure) {
        ToasResp.errorMessage(newState.exceptionError);
      } else if (newState.loginStatus == SmartPayAppState.submissionSuccess) {
        RouteConfigKQ.toReplacement(page: DashboardView());
        return;
      }
    });
    return Scaffold(
        appBar: AppBarWithoutBack(),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(children: <InlineSpan>[
                  TextSpan(
                    text: "Don't have an account? ",
                    style: getMediumStyle(
                        color: ColorManager.spalshRentalColor, fontSize: 12),
                  ),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => RouteConfigKQ.to(page: SignUpView()),
                      text: 'Sign Up',
                      style: getMediumStyle(
                          decoration: TextDecoration.underline,
                          color: ColorManager.primary,
                          fontSize: 12)),
                ]),
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.only(left: 25, right: 25, top: 20),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            buildWidgetForHeaderDesc(
                label: 'Hi There! 👋',
                text1: 'Welcome back, please sign in to your account.'),
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
            20.0.h,
            SmartPayField(
              obscureText: !authState.obscure,
              hasTextfieldLabel: false,
              hintText: 'Password',
              validate: (v) => newpasswordValidator(v!),
              onChanged: (p0) => ref
                  .read(authBloc.notifier)
                  .mapEventsToState(PasswordChangedEvent(passwordVal: p0)),
              inputType: TextInputType.text,
              isLastField: true,
              suffixIcon: InkWell(
                child: Icon(
                    authState.obscure
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    size: 18,
                    color: ColorManager.grey.withOpacity(0.5)),
                onTap: () =>
                    ref.read(authBloc.notifier).setPasswordVisibility(),
              ),
            ),
            20.0.h,
            GestureDetector(
              onTap: () => RouteConfigKQ.to(page: ForgotPasswordView()),
              child: Text('Forgot password?',
                  style: getExtraBoldStyle(
                      color: ColorManager.primary, fontSize: 14)),
            ),
            30.0.h,
            SmartPayButton(
              disable: !authState.loginBool,
              isLoading: authState.loginStatus ==
                  SmartPayAppState.submissionInProgress,
              text: 'Sign In',
              color: ColorManager.darkPrimary,
              onTap: !authState.loginBool
                  ? () {}
                  : () => ref
                      .read(authBloc.notifier)
                      .mapEventsToState(LoginEvent()),
            ),
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
          ],
        )));
  }
}
