import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';

class SmartPayDropdownField extends StatelessWidget {
  final String? currentText;
  final void Function() onChanged;
  final String? labelText;
  final String hintText;
  final bool hasLabelText;

  const SmartPayDropdownField(
      {super.key,
      required this.onChanged,
      this.currentText,
      required this.hintText,
      this.labelText,
      this.hasLabelText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasLabelText
            ? Padding(
                padding: EdgeInsets.only(bottom: 13, top: 15),
                child: Text(
                  labelText ?? 'tt',
                  style: getMediumStyle(color: ColorManager.spalshRentalColor),
                ),
              )
            : SizedBox.shrink(),
        GestureDetector(
          onTap: onChanged,
          child: Container(
            height: 62,
            decoration: BoxDecoration(
              color: ColorManager.spalshRentalColor.withOpacity(0.03),
              border: Border.all(color: ColorManager.primary, width: 0.01),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                        currentText?.isNotEmpty == true
                            ? currentText!
                            : hintText,
                        style: currentText?.isNotEmpty == true
                            ? getBoldStyle(
                                color: ColorManager.spalshRentalColor,
                                fontSize: 12)
                            : getLightStyle(
                                color: ColorManager.spalshRentalColor,
                                fontSize: 12)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Icon(Icons.keyboard_arrow_down_rounded , color: ColorManager.grey.withOpacity(0.5), size: 24),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
