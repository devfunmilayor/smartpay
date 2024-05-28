import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';

import 'package:smart_pay/core/util/num.dart' as extra;

class SmartPayButton extends StatelessWidget {
  final Function()? onTap;
  final Color color;
  final Color? textColor;
  final String? text;
  final bool? isLoading;
  final bool hasIcon;
  final Widget? iconWidget;
  final bool isSmall;
  final bool disable;
  final bool hasBorder;
  final double? height;
  final Color? borderColor;
  final TextStyle? tx;
  final double? isBorderRadiusNeeded;
  const SmartPayButton(
      {super.key,
      this.onTap,
      this.color = const Color(0xff21205C),
      this.textColor,
      this.text,
      this.isLoading = false,
      this.hasIcon = false,
      this.iconWidget,
      this.isSmall = false,
      this.disable = false,
      this.hasBorder = false,
      this.height = 60,
      this.isBorderRadiusNeeded,
      this.borderColor,
      this.tx});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => HapticFeedback.lightImpact(),
      onTap: onTap,
      child: Container(
        height: height,
        width: isSmall ? 150 : double.infinity,
        decoration: BoxDecoration(
          color: isLoading!
              ? color.withOpacity(.5)
              : disable
                  ? color.withOpacity(.6)
                  : color,
          borderRadius: BorderRadius.circular(isBorderRadiusNeeded ?? 15.r),
          border: hasBorder
              ? Border.all(color: borderColor!)
              : Border.all(width: 0, color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasIcon ? iconWidget! : SizedBox.shrink(),
            hasIcon
                ? SizedBox(
                    width: 15,
                  )
                : SizedBox.shrink(),
            Center(
                child: Text(isLoading! ? "" : text!,
                    overflow: TextOverflow.ellipsis,
                    style: tx ??
                        getBoldStyle(
                            color: textColor ?? ColorManager.white,
                            fontSize: 15))),
            24.0.h,
            isLoading!
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                        strokeWidth: 0.5, color: CupertinoColors.white))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
