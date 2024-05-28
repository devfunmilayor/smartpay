import 'package:flutter/cupertino.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/shared/smart_pay_keyboard.dart';

Widget buildOTPPinPut(
    {Function(String)? onChanged,
    VerificationAndPinController? verificationCtrl,
    final String? Function(String?)? otpValidator,
    int length = 4,
    final String? Function(String?)? oncomplete}) {
  final defaultPinTheme = PinTheme(
    width: 60,
    height: 55,
    textStyle: getBoldStyle(color: ColorManager.black, fontSize: 16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.primary.withOpacity(0.05)),
  );
  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: ColorManager.primary),
    color: ColorManager.lightGrey.withOpacity(0.05),
  );

  return Pinput(
      defaultPinTheme: defaultPinTheme,
      length: length,
      controller: verificationCtrl?.pinController,
      focusedPinTheme: focusedPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      showCursor: true,
      useNativeKeyboard: false,
      onChanged: onChanged,
      readOnly: false,
      validator: otpValidator,
      onCompleted: oncomplete);
}
