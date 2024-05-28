import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pay/core/app/smart_pay_state.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/feautres/intro/views/dashboard_view.dart';
import 'package:smart_pay/gen/assets.gen.dart';

class ConfirmationView extends ConsumerWidget {
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authBloc.select((vaue) => vaue));
    final fullName = authState.usersSignUpModel?.fullName ?? '';
    final name = fullName.split(' ').first;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.png.thumbs.path),
          Text('Congratulations, $name',
              textAlign: TextAlign.center,
              style: getBoldStyle(color: ColorManager.black, fontSize: 25)),
          20.0.h,
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(
              'You have completed the onboarding, you can start using SmartPay ',
              textAlign: TextAlign.center,
              style: getRegularStyle(
                  color: ColorManager.darkPrimary.withOpacity(0.5),
                  fontSize: 14),
            ),
          ),
          30.0.h,
          Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.85,
              ),
              child: SmartPayButton(
                onTap: () {
                  RouteConfigKQ.to(page: DashboardView());
                },
                color: ColorManager.darkPrimary,
                text: 'Get Started',
              ))
        ],
      ),
    ));
  }
}
