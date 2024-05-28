import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/app/smart_pay_state.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/core/shared/smart_pay_app_bar.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';
import 'package:smart_pay/core/util/commons.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/core/util/screen_extn.dart';
import 'package:smart_pay/feautres/auth/presentation/views/create_password.dart';
import 'package:smart_pay/gen/assets.gen.dart';

class VerifyIdentity extends ConsumerWidget {
  const VerifyIdentity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authBloc.select((vaue) => vaue));
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 30),
          child: SmartPayButton(
            onTap: () => RouteConfigKQ.to(page: CreatePasswordView()),
            text: 'Continue',
            color: ColorManager.darkPrimary,
          ),
        ),
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
                      child: Image.asset(Assets.png.person.path),
                    )),
              ),
              10.0.h,
              Text('Verify your identity',
                  style: getBoldStyle(color: ColorManager.black, fontSize: 25)),
              RichText(
                text: TextSpan(children: <InlineSpan>[
                  TextSpan(
                    text: "Where would you like ",
                    style: getRegularStyle(
                        color: ColorManager.darkPrimary.withOpacity(0.5),
                        fontSize: 14),
                  ),
                  TextSpan(
                      text: "SmartPay ",
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: 14)),
                  TextSpan(
                    text: "to send your security code?",
                    style: getRegularStyle(
                        color: ColorManager.darkPrimary.withOpacity(0.5),
                        fontSize: 14),
                  ),
                ]),
              ),
              SizedBox(height: context.screenHeight(0.1)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorManager.primary.withOpacity(0.04),
                ),
                child: ListTile(
                  leading: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: ColorManager.primary, shape: BoxShape.circle),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          CupertinoIcons.check_mark,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                  title: Text('Email',
                      style: getBoldStyle(
                          color: ColorManager.darkPrimary, fontSize: 15)),
                  subtitle: Text(
                      Commons.maskEmail(authState.emailForgetPasswordCtrl),
                      style: getLightStyle(
                          color: ColorManager.darkPrimary, fontSize: 12)),
                  trailing: Icon(
                    Icons.email_outlined,
                    color: ColorManager.darkPrimary.withOpacity(0.5),
                    size: 20,
                  ),
                ),
              ),
            ])));
  }
}
