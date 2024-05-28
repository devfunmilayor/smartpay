import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/core/app/smart_pay.dart.dart';

import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/core/util/screen_extn.dart';

buildWidgetForHeaderDesc({
  String? label,
  text1,
}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(label ?? '',
        textAlign: TextAlign.center,
        style: getBoldStyle(color: ColorManager.black, fontSize: 25)),
    10.0.h,
    Text(
      '$text1 \n',
      style: getRegularStyle(
          color: ColorManager.darkPrimary.withOpacity(0.5), fontSize: 14),
    ),
  ]);
}

buildBrandButton(Widget brandIcon, VoidCallback onpressed) {
  var c = navigatorKey.currentState?.context;

  return GestureDetector(
    onTap: onpressed,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 60,
      width: c?.screenWidth(0.4),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.black.withOpacity(0.07),
        ),
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: brandIcon,
    ),
  );
}

buildBottomNavForSignUp({
  Function? onpressed,
  String? text1,
  String? text2,
}) {
  return RichText(
    text: TextSpan(children: <InlineSpan>[
      TextSpan(
        text: text1 ?? "Don't have an account? ",
        style:
            getMediumStyle(color: ColorManager.spalshRentalColor, fontSize: 12),
      ),
      TextSpan(
        recognizer: TapGestureRecognizer()..onTap = () => onpressed,
        text: text2 ?? 'Sign Up',
        style: getMediumStyle(
            decoration: TextDecoration.underline,
            color: ColorManager.primary,
            fontSize: 12),
      ),
    ]),
  );
}
