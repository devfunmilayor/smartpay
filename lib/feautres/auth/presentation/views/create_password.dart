import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/app/smart_pay_state.dart';
import 'package:smart_pay/core/mixin/smart_mixin.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/shared/smart_pay_app_bar.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';
import 'package:smart_pay/core/shared/smart_pay_field.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_event.dart';
import 'package:smart_pay/feautres/auth/presentation/widgets/login_widget.dart';

class CreatePasswordView extends ConsumerStatefulWidget {
  const CreatePasswordView({super.key});

  @override
  ConsumerState<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends ConsumerState<CreatePasswordView>
    with SmartPayValidate {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authBloc.select((vaue) => vaue));

    return Scaffold(
        appBar: AppBarWithBack(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 50),
          child: SmartPayButton(
            text: 'Create New Password',
            color: ColorManager.darkPrimary,
          ),
        ),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.only(
            left: 25,
            right: 25,
            top: 20,
          ),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            buildWidgetForHeaderDesc(
                label: 'Create New Password',
                text1:
                    'Please enter a new password below different from the previous password'),
            20.0.h,
            SmartPayField(
              obscureText: !authState.obscure,
              hasTextfieldLabel: false,
              hintText: 'Password',
              validate: (v) => newpasswordValidator(v!),
              onChanged: (p0) => ref.read(authBloc.notifier).mapEventsToState(
                  NewPasswordChangedEvent(newpasswordVal: p0)),
              inputType: TextInputType.text,
              isLastField: false,
              suffixIcon: InkWell(
                child: Icon(
                    authState.obscure
                        ? CupertinoIcons.eye_fill
                        : CupertinoIcons.eye_slash,
                    size: 18),
                onTap: () =>
                    ref.read(authBloc.notifier).setPasswordVisibility(),
              ),
            ),
            20.0.h,
            SmartPayField(
              obscureText: !authState.obscure,
              hasTextfieldLabel: false,
              hintText: 'Confirm Password',
              validate: ((p0) =>
                  rePasswordValidator(authState.newPassword, p0!)),
              onChanged: (p0) => ref.read(authBloc.notifier).mapEventsToState(
                  ConfirmNewPasswordChangedEvent(confirmnewpasswordVal: p0)),
              inputType: TextInputType.text,
              isLastField: false,
              suffixIcon: InkWell(
                child: Icon(
                    authState.obscure
                        ? CupertinoIcons.eye_fill
                        : CupertinoIcons.eye_slash,
                    size: 18),
                onTap: () =>
                    ref.read(authBloc.notifier).setPasswordVisibility(),
              ),
            ),
          ],
        )));
  }
}
