import 'package:flutter/material.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/shared/smart_pay_button.dart';
import 'package:smart_pay/core/util/num.dart';
import 'package:smart_pay/core/util/screen_extn.dart';

class SmartPayAlertDialog extends StatelessWidget {
  const SmartPayAlertDialog(
      {super.key,
      required this.title,
      required this.actionText,
      required this.actionText2,
      required this.onAction,
      required this.onAction2});
  final String title;
  final String actionText;
  final String actionText2;

  final VoidCallback onAction;
  final VoidCallback onAction2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: ColorManager.white,
      backgroundColor: ColorManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: context.screenWidth(0.4),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: getBoldStyle(color: ColorManager.spalshRentalColor),
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              SmartPayButton(
                onTap: onAction,
                isSmall: true,
                color: ColorManager.darkPrimary,
                height: 33,
                text: actionText,
                tx: getMediumStyle(color: ColorManager.white),
              ),
              10.0.h,
              SmartPayButton(
                onTap: onAction2,
                hasBorder: true,
                isSmall: true,
                borderColor: ColorManager.darkGreen,
                height: 33,
                color: Colors.transparent,
                text: actionText2,
                tx: getMediumStyle(color: ColorManager.spalshRentalColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
