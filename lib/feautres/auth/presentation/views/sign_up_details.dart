import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/app/smart_pay_state.dart';
import 'package:smart_pay/core/enum/smart_pay_enum.dart';
import 'package:smart_pay/core/mixin/smart_mixin.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/resources/countries.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/core/shared/smaert_pay_toast.dart';
import 'package:smart_pay/core/shared/smart_dropdown.dart';

import 'package:smart_pay/core/shared/smart_pay_app_bar.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';

import 'package:smart_pay/core/shared/smart_pay_field.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_event.dart';
import 'package:smart_pay/feautres/auth/presentation/views/set_pin.dart';

class SignUpDetailsView extends ConsumerStatefulWidget {
  const SignUpDetailsView({super.key});

  @override
  ConsumerState<SignUpDetailsView> createState() => _SignUpDetailsViewState();
}

class _SignUpDetailsViewState extends ConsumerState<SignUpDetailsView>
    with SmartPayValidate {
  Map<String, String>? selectedCountry;
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authBloc.select((vaue) => vaue));
    ref.listen(authBloc, (previousState, newState) {
      if (newState.signUpStatus == SmartPayAppState.submissionFailure) {
        ToasResp.errorMessage(newState.exceptionError);
      } else if (newState.signUpStatus == SmartPayAppState.submissionSuccess) {
        RouteConfigKQ.to(page: SetPinCodeView());
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
            Text('Hey there! tell us a bit',
                style: getBoldStyle(color: ColorManager.black, fontSize: 25)),
            RichText(
              text: TextSpan(children: <InlineSpan>[
                TextSpan(
                    text: "about ",
                    style:
                        getBoldStyle(color: ColorManager.black, fontSize: 25)),
                TextSpan(
                    text: "yourself",
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: 25)),
              ]),
            ),
            20.0.h,
            SmartPayField(
                hasTextfieldLabel: false,
                hintText: 'Full name',
                inputType: TextInputType.name,
                onChanged: (p0) => ref
                    .read(authBloc.notifier)
                    .mapEventsToState(FullNameChangedEvent(fullName: p0)),
                validate: ((p0) => validateUserInput(p0, 'Full Name')),
                isLastField: false),
            20.0.h,
            SmartPayField(
                hasTextfieldLabel: false,
                hintText: 'Username',
                inputType: TextInputType.text,
                onChanged: (p0) => ref
                    .read(authBloc.notifier)
                    .mapEventsToState(UserNameChangedEvent(userNameVal: p0)),
                isLastField: false),
            20.0.h,
            SmartPayDropdownField(
                currentText: selectedCountry != null
                    ? "${selectedCountry!['flag']} ${selectedCountry!['name']}"
                    : '',
                onChanged: () {
                  showModalBottomSheet(
                      backgroundColor: ColorManager.white,
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0)),
                      ),
                      builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.6,
                          minChildSize: 0.4,
                          maxChildSize: 0.6,
                          expand: false,
                          builder: (context, scrollController) {
                            return CountryPickerSheet(
                                selectedCountry: selectedCountry,
                                scrollController: scrollController,
                                onCountrySelected: (country) {
                                  setState(() {
                                    selectedCountry = country;
                                  });
                                  ref.read(authBloc.notifier).mapEventsToState(
                                      CountryChangedEvent(
                                          countryVal:
                                              selectedCountry!['code'] ?? ''));
                                });
                          }));
                },
                hintText: 'Select Country',
                hasLabelText: false),
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
            30.0.h,
            SmartPayButton(
              isLoading: authState.signUpStatus ==
                  SmartPayAppState.submissionInProgress,
              disable: !authState.signupBool,
              text: 'Continue',
              onTap: !authState.signupBool
                  ? () {}
                  : () => ref
                      .read(authBloc.notifier)
                      .mapEventsToState(RegisterEvent()),
              color: ColorManager.darkPrimary,
            ),
            30.0.h,
          ],
        )));
  }
}
