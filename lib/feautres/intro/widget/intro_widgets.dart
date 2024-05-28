import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/core/resources/app_colors.dart';

import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/feautres/auth/presentation/views/login_view.dart';

import 'package:smart_pay/gen/assets.gen.dart';

class BuildIntroWidget extends StatelessWidget {
  BuildIntroWidget(
      {super.key,
      this.imgUrl,
      this.title,
      this.subtitle,
      this.isIncreaseMargin = false});

  final bool isIncreaseMargin;
  final Widget? imgUrl;
  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 25, left: 25),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          30.0.h,
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => RouteConfigKQ.toReplacement(
                page: LoginView(),
              ),
              child: Text(
                'Skip',
                style: getExtraBoldStyle(color: ColorManager.primary),
              ),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: imgUrl ?? SizedBox.shrink()),
          20.0.h,
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(title ?? '',
                textAlign: TextAlign.center,
                style: getExtraBoldStyle(
                    color: ColorManager.spalshRentalColor, fontSize: 20)),
          ),
          12.0.h,
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(subtitle ?? '',
                textAlign: TextAlign.center,
                style: getLightStyle(
                    letterSpacing: 0.2,
                    color: ColorManager.spalshRentalColor,
                    fontSize: 12)),
          )
        ]));
  }
}

List<IntroSx> introsx = [
  IntroSx(
      imgUrl: Assets.svg.intro1.svg(
        fit: BoxFit.contain,
      ),
      label: 'The fastest transaction process only here',
      desc:
          'Get easy to pay all your bills with just a few steps. Paying your bills becomes fast and efficient'),
  IntroSx(
      imgUrl: Assets.svg.intro0.svg(),
      label: 'Finance app the safest and most trusted.',
      desc:
          'Your finance work starts here. We are here to help you track and deal with speeding up your transactions'),
];

class IntroSx {
  final SvgPicture? imgUrl;
  final String? label, desc;
  IntroSx({this.imgUrl, this.label, this.desc});
}

buildNextBtn({Function()? click}) {
  return InkResponse(
      borderRadius: BorderRadius.circular(30),
      onTap: click,
      child: CircleAvatar(
          radius: 30,
          backgroundColor: ColorManager.primary,
          child: Icon(Icons.arrow_forward_ios_sharp,
              size: 18, color: ColorManager.white)));
}

buildGetstartedBtn({Function()? clcik2getStarted, Function()? click2login}) {
  return Column(children: [
    SmartPayButton(
        onTap: clcik2getStarted,
        text: 'Lets Get Started',
        color: ColorManager.primary),
    15.0.h,
    alreradyHaveAccountFunc(click2login: click2login)
  ]);
}

alreradyHaveAccountFunc({Function()? click2login, text1, text2}) {
  return InkWell(
    onTap: click2login,
    child: RichText(
      text: TextSpan(children: <InlineSpan>[
        TextSpan(
          text: text1 ?? 'Already have an account? ',
          style: getMediumStyle(
              color: ColorManager.spalshRentalColor, fontSize: 12),
        ),
        TextSpan(
          text: text2 ?? 'Sign In',
          style: getMediumStyle(
              decoration: TextDecoration.underline,
              color: ColorManager.primary,
              fontSize: 12),
        ),
      ]),
    ),
  );
}
