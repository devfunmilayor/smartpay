import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/app/smart_pay_state.dart';
import 'package:smart_pay/core/enum/smart_pay_enum.dart';
import 'package:smart_pay/core/mixin/smart_mixin.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/core/shared/smaert_pay_toast.dart';
import 'package:smart_pay/core/shared/smart_pay_app_bar.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';
import 'package:smart_pay/core/shared/smart_pay_field.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/core/util/screen_extn.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_event.dart';
import 'package:smart_pay/feautres/auth/presentation/views/verify_identity.dart';
import 'package:smart_pay/feautres/auth/presentation/widgets/login_widget.dart';
import 'package:smart_pay/gen/assets.gen.dart';

class ForgotPasswordView extends ConsumerWidget with SmartPayValidate {
  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authBloc.select((vaue) => vaue));
    ref.listen(authBloc, (previousState, newState) {
      if (newState.forgotPasswordStatus == SmartPayAppState.submissionFailure) {
        ToasResp.errorMessage(newState.exceptionError);
      } else if (newState.forgotPasswordStatus ==
          SmartPayAppState.submissionSuccess) {
        RouteConfigKQ.to(page: VerifyIdentity());
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
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.grey3.withOpacity(0.09)),
                    child: Center(
                      child: Image.asset(Assets.png.lock.path),
                    )),
              ),
              10.0.h,
              buildWidgetForHeaderDesc(
                  label: 'Password Recovery',
                  text1:
                      'Enter your registered email below to receive password instructions.'),
              SmartPayField(
                  hasTextfieldLabel: false,
                  validate: validateEmail,
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                  onChanged: (p0) => ref
                      .read(authBloc.notifier)
                      .mapEventsToState(
                          ForgotPasswordEmailChangeEvent(emailVal: p0)),
                  isLastField: false),
              SizedBox(height: context.screenHeight(0.1)),
              SmartPayButton(
                isLoading: authState.forgotPasswordStatus ==
                    SmartPayAppState.submissionInProgress,
                onTap: () => ref
                    .read(authBloc.notifier)
                    .mapEventsToState(ForgortPasswordSendEmailEvent()),
                disable: authState.emailForgetPasswordCtrl.isEmpty,
                text: 'Send me email',
                color: ColorManager.darkPrimary,
              ),
            ])));
  }
}
